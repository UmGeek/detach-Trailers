script_name("detachTrailer")
script_author("noname")
script_description("Press Y to detach Trailer")

local YES = 11 -- Y/YES

function main()
	while true do
		wait(40)
		local vehicle = getCarCharIsUsing(PLAYER_PED)
		if isPlayerControlOn(PLAYER_HANDLE) and doesVehicleExist(vehicle) then
			if isButtonPressed(PLAYER_HANDLE, YES) then
				local trailer = trailerInVehicle(vehicle)
				if doesVehicleExist(trailer) then detachTrailerFromCab(trailer, vehicle) end
				while isButtonPressed(PLAYER_HANDLE, YES) do wait(0) end
			end
		end
	end
end

function trailerInVehicle(vehicle)
	return getVehiclePointerHandle(readMemory(getCarPointer(vehicle) + 1224, 4, false))
end