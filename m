Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2065AFCB4
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 08:42:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65AF3C0D2BF;
	Wed,  7 Sep 2022 06:42:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF9CAC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 06:42:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2875L1rL016765;
 Wed, 7 Sep 2022 08:42:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=twfJUUJBm5YkRFVCOuGFjLlSVR6FRCsfXL3i20aPwok=;
 b=evnMiO4GtDTeLBSJrhybrymKNgtf3kiGylrhihaddJzyFpsSIwQzPYoG2wnIeQONnJUa
 7WTpbLPg9ZjYrSsYvM2tNPEvbIhSZIe10tTAOPq151XXfoNXjZ/IdpLf8sKnYgwJaKPL
 SHWZ0upMD1wSVxvOyMhWYMViuFzdWNvtsYYW7iWTApwFjrCmnB25yRqzw31FlVd0x4Po
 KL0mu70djW1qTDf/kjjxsl493qKX/DtMEKVOn2B4q6HKo07PLnQwEaffHkZn94TVp8vd
 Xu6DyFw/L2VhTMDiUDSRelyOFUZo8AYaw7EmlTjwUJD6Y1OHl8TMtPJHOCSuGnHTLFj+ Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbx91meht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 08:42:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12F0B100034;
 Wed,  7 Sep 2022 08:42:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CFE62128B7;
 Wed,  7 Sep 2022 08:42:16 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 08:42:15 +0200
Message-ID: <bb7f0cfe-4978-4dcd-2958-a7da394f160a@foss.st.com>
Date: Wed, 7 Sep 2022 08:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
 <20220906185314.3.I481093701859eb171c9270f859756d0564bdebe6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220906185314.3.I481093701859eb171c9270f859756d0564bdebe6@changeid>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/4] stm32mp: stm32prog: solve warning for
 64bits compilation
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

On 9/6/22 18:53, Patrick Delaunay wrote:
> Solve many compilation warning when stm32prog is activated on the aarch64.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c   | 14 +++++++-------
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c  | 16 ++++++++--------
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h  | 14 +++++++-------
>  .../cmd_stm32prog/stm32prog_serial.c             | 15 +++++++--------
>  .../mach-stm32mp/cmd_stm32prog/stm32prog_usb.c   |  4 ++--
>  5 files changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index cb9e20da136..d2666b97757 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -126,21 +126,21 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  		char *bootm_argv[5] = {
>  			"bootm", boot_addr_start, "-", dtb_addr, NULL
>  		};
> -		u32 uimage = data->uimage;
> -		u32 dtb = data->dtb;
> -		u32 initrd = data->initrd;
> +		const void *uimage = (void *)data->uimage;
> +		const void *dtb = (void *)data->dtb;
> +		const void *initrd = (void *)data->initrd;
>  
>  		if (!dtb)
>  			bootm_argv[3] = env_get("fdtcontroladdr");
>  		else
>  			snprintf(dtb_addr, sizeof(dtb_addr) - 1,
> -				 "0x%x", dtb);
> +				 "0x%p", dtb);
>  
>  		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
> -			 "0x%x", uimage);
> +			 "0x%p", uimage);
>  
>  		if (initrd) {
> -			snprintf(initrd_addr, sizeof(initrd_addr) - 1, "0x%x:0x%x",
> +			snprintf(initrd_addr, sizeof(initrd_addr) - 1, "0x%p:0x%zx",
>  				 initrd, data->initrd_size);
>  			bootm_argv[2] = initrd_addr;
>  		}
> @@ -148,7 +148,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  		printf("Booting kernel at %s %s %s...\n\n\n",
>  		       boot_addr_start, bootm_argv[2], bootm_argv[3]);
>  		/* Try bootm for legacy and FIT format image */
> -		if (genimg_get_format((void *)uimage) != IMAGE_FORMAT_INVALID)
> +		if (genimg_get_format(uimage) != IMAGE_FORMAT_INVALID)
>  			do_bootm(cmdtp, 0, 4, bootm_argv);
>  		else if (CONFIG_IS_ENABLED(CMD_BOOTZ))
>  			do_bootz(cmdtp, 0, 4, bootm_argv);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 3b2652a0e0d..67be1ac7ff8 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -322,7 +322,7 @@ void stm32prog_header_check(uintptr_t raw_header, struct image_header_s *header)
>  	header->image_length = 0x0;
>  }
>  
> -static u32 stm32prog_header_checksum(u32 addr, struct image_header_s *header)
> +static u32 stm32prog_header_checksum(uintptr_t addr, struct image_header_s *header)
>  {
>  	u32 i, checksum;
>  	u8 *payload;
> @@ -398,7 +398,7 @@ static int parse_name(struct stm32prog_data *data,
>  	if (strlen(p) < sizeof(part->name)) {
>  		strcpy(part->name, p);
>  	} else {
> -		stm32prog_err("Layout line %d: partition name too long [%d]: %s",
> +		stm32prog_err("Layout line %d: partition name too long [%zd]: %s",
>  			      i, strlen(p), p);
>  		result = -EINVAL;
>  	}
> @@ -537,7 +537,7 @@ int (* const parse[COL_NB_STM32])(struct stm32prog_data *data, int i, char *p,
>  };
>  
>  static int parse_flash_layout(struct stm32prog_data *data,
> -			      ulong addr,
> +			      uintptr_t addr,
>  			      ulong size)
>  {
>  	int column = 0, part_nb = 0, ret;
> @@ -1440,7 +1440,7 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  	if (offset + *size > otp_size)
>  		*size = otp_size - offset;
>  
> -	memcpy((void *)((u32)data->otp_part + offset), buffer, *size);
> +	memcpy((void *)((uintptr_t)data->otp_part + offset), buffer, *size);
>  
>  	return 0;
>  }
> @@ -1479,7 +1479,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  						 data->otp_part, OTP_SIZE_TA);
>  		else if (IS_ENABLED(CONFIG_ARM_SMCCC))
>  			result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
> -						(u32)data->otp_part, 0);
> +						(unsigned long)data->otp_part, 0);
>  		if (result)
>  			goto end_otp_read;
>  	}
> @@ -1491,7 +1491,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
>  
>  	if (offset + *size > otp_size)
>  		*size = otp_size - offset;
> -	memcpy(buffer, (void *)((u32)data->otp_part + offset), *size);
> +	memcpy(buffer, (void *)((uintptr_t)data->otp_part + offset), *size);
>  
>  end_otp_read:
>  	log_debug("%s: result %i\n", __func__, result);
> @@ -1521,7 +1521,7 @@ int stm32prog_otp_start(struct stm32prog_data *data)
>  					 data->otp_part, OTP_SIZE_TA);
>  	} else if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
>  		arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
> -			      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
> +			      (uintptr_t)data->otp_part, 0, 0, 0, 0, 0, &res);
>  
>  		if (!res.a0) {
>  			switch (res.a1) {
> @@ -1951,7 +1951,7 @@ int stm32prog_dfu_init(struct stm32prog_data *data)
>  	return dfu_init_entities(data);
>  }
>  
> -int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size)
> +int stm32prog_init(struct stm32prog_data *data, uintptr_t addr, ulong size)
>  {
>  	memset(data, 0x0, sizeof(*data));
>  	data->read_phase = PHASE_RESET;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index ac300768ca0..397506ac47c 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -154,7 +154,7 @@ struct stm32prog_data {
>  	u32			offset;
>  	char			error[255];
>  	struct stm32prog_part_t	*cur_part;
> -	u32			*otp_part;
> +	void			*otp_part;
>  	u8			pmic_part[PMIC_SIZE];
>  
>  	/* SERIAL information */
> @@ -165,12 +165,12 @@ struct stm32prog_data {
>  	u8	read_phase;
>  
>  	/* bootm information */
> -	u32	uimage;
> -	u32	dtb;
> -	u32	initrd;
> -	u32	initrd_size;
> +	uintptr_t	uimage;
> +	uintptr_t	dtb;
> +	uintptr_t	initrd;
> +	size_t		initrd_size;
>  
> -	u32	script;
> +	uintptr_t	script;
>  
>  	/* OPTEE PTA NVMEM */
>  	struct udevice *tee;
> @@ -209,7 +209,7 @@ char *stm32prog_get_error(struct stm32prog_data *data);
>  	}
>  
>  /* Main function */
> -int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size);
> +int stm32prog_init(struct stm32prog_data *data, uintptr_t addr, ulong size);
>  void stm32prog_clean(struct stm32prog_data *data);
>  
>  #ifdef CONFIG_CMD_STM32PROG_SERIAL
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index 1bf5f5ae0ac..9f2ab2b625c 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -300,7 +300,7 @@ static void stm32prog_serial_putc(u8 w_byte)
>  }
>  
>  /* Helper function ************************************************/
> -static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
> +static u8 stm32prog_start(struct stm32prog_data *data, uintptr_t address)
>  {
>  	u8 ret = 0;
>  	struct dfu_entity *dfu_entity;
> @@ -353,7 +353,7 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>  	} else {
>  		void (*entry)(void) = (void *)address;
>  
> -		printf("## Starting application at 0x%x ...\n", address);
> +		printf("## Starting application at 0x%p ...\n", (void *)address);
>  		(*entry)();
>  		printf("## Application terminated\n");
>  		ret = -ENOEXEC;
> @@ -368,9 +368,9 @@ static u8 stm32prog_start(struct stm32prog_data *data, u32 address)
>   * @tmp_xor:		Current xor value to update
>   * Return: The address area
>   */
> -static u32 get_address(u8 *tmp_xor)
> +static uintptr_t get_address(u8 *tmp_xor)
>  {
> -	u32 address = 0x0;
> +	uintptr_t address = 0x0;
>  	u8 data;
>  
>  	data = stm32prog_serial_getc();
> @@ -487,7 +487,7 @@ static void get_phase_command(struct stm32prog_data *data)
>   */
>  static void read_memory_command(struct stm32prog_data *data)
>  {
> -	u32 address = 0x0;
> +	uintptr_t address = 0x0;
>  	u8 rcv_data = 0x0, tmp_xor = 0x0;
>  	u32 counter = 0x0;
>  
> @@ -532,7 +532,7 @@ static void read_memory_command(struct stm32prog_data *data)
>   */
>  static void start_command(struct stm32prog_data *data)
>  {
> -	u32 address = 0;
> +	uintptr_t address = 0;
>  	u8 tmp_xor = 0x0;
>  	u8 ret, rcv_data;
>  
> @@ -546,8 +546,7 @@ static void start_command(struct stm32prog_data *data)
>  		return;
>  	}
>  	/* validate partition */
> -	ret = stm32prog_start(data,
> -			      address);
> +	ret = stm32prog_start(data, address);
>  
>  	if (ret)
>  		stm32prog_serial_result(ABORT_BYTE);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index bcb4d373f69..be38ff239b2 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -41,7 +41,7 @@ static int stm32prog_set_phase(struct stm32prog_data *data, u8 phase,
>  static int stm32prog_cmd_write(u64 offset, void *buf, long *len)
>  {
>  	u8 phase;
> -	u32 address;
> +	uintptr_t address;
>  	u8 *pt = buf;
>  	void (*entry)(void);
>  	int ret;
> @@ -58,7 +58,7 @@ static int stm32prog_cmd_write(u64 offset, void *buf, long *len)
>  	address = (pt[1] << 24) | (pt[2] << 16) | (pt[3] << 8) | pt[4];
>  	if (phase == PHASE_RESET) {
>  		entry = (void *)address;
> -		printf("## Starting application at 0x%x ...\n", address);
> +		printf("## Starting application at 0x%p ...\n", entry);
>  		(*entry)();
>  		printf("## Application terminated\n");
>  		return 0;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
