import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.src.routers import owner, products, stalls

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # For production, replace "*" with specific frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(owner.route, prefix="/users", tags=["Users"])

# Remove comment on the bottom code later, wala pa kase sa products
app.include_router(products.route, prefix="/products", tags=["Products"])

app.include_router(stalls.route, prefix="/stalls", tags=["Stalls"])


if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=8080)