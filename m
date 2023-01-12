Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECA6679AC
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:42:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E753CC65048;
	Thu, 12 Jan 2023 15:42:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71866C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:42:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CBHMFp003657; Thu, 12 Jan 2023 16:42:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2+yx3NIW2ppp4WUyDBGZOTnXbomAnT3XAdPAVaZX6ZQ=;
 b=WlMbmj4F8YO9VbqIBMBjEWmW5NuUIaZgdsRq3OjCLFHV4uKVzllGOHyJKBIC+f8vxTMc
 s0DLGLr6WYxnOKgTYp+rFNtw81CKSZefZDl2brwhKD1zqF7bJ/NI6enIPbzkKtRf+SmV
 b1pw0yiffCMgzAxMPnBSvvBE+H+Ih0QeUvFtZeomXRVUdPjk1LelTFeAnWPDS7tVtrhU
 a+b25cC/2zg1FoHVMF7bM4sGNqvlhbYtB3kMi6qCNbr6RaS/OB5oaJTXYFei7hY3wIIF
 2aJ++NHjWGi7F67j63lQTXgsJw4BaG22EbeAUgtaxA6xj9Sysurkd7FH6OGK2quMov0n +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k64m0ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:42:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDF9010002A;
 Thu, 12 Jan 2023 16:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C75A621B53A;
 Thu, 12 Jan 2023 16:42:18 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:42:18 +0100
Message-ID: <0ce98a54-99ce-1945-e6d2-29149a43fb2f@foss.st.com>
Date: Thu, 12 Jan 2023 16:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
 <20230106131952.2.I1ce5f38d7d31c1cf1429ca1b29ef202a1f5b78c6@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230106131952.2.I1ce5f38d7d31c1cf1429ca1b29ef202a1f5b78c6@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] stm32mp: Add OP-TEE support in bsec
	driver
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

HI Patrick

On 1/6/23 13:20, Patrick Delaunay wrote:
> When OP-TEE is used, the SMC for BSEC management are not available and
> the STM32MP BSEC pseudo TA must be used (it is mandatory for STM32MP13
> and it is a new feature for STM32MP15x).
> 
> The BSEC driver try to open a session to this PTA BSEC at probe
> and use it for OTP read or write access to fuse or to shadow.
> 
> This patch also adapts the commands stm32key and stboard to handle
> the BSEC_LOCK_PERM lock value instead of 1.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c              | 173 +++++++++++++++++++++-
>  arch/arm/mach-stm32mp/cmd_stm32key.c      |   4 +-
>  arch/arm/mach-stm32mp/include/mach/bsec.h |   7 +
>  board/st/common/cmd_stboard.c             |   5 +-
>  doc/board/st/stm32mp1.rst                 |   6 +-
>  5 files changed, 183 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 51ccff9aa560..fe79c986f95c 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -10,9 +10,11 @@
>  #include <dm.h>
>  #include <log.h>
>  #include <misc.h>
> +#include <tee.h>
>  #include <asm/io.h>
>  #include <asm/arch/bsec.h>
>  #include <asm/arch/stm32mp1_smc.h>
> +#include <dm/device.h>
>  #include <dm/device_compat.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/iopoll.h>
> @@ -63,10 +65,43 @@
>   */
>  #define BSEC_LOCK_PROGRAM		0x04
>  
> +#define PTA_BSEC_UUID { 0x94cf71ad, 0x80e6, 0x40b5, \
> +	{ 0xa7, 0xc6, 0x3d, 0xc5, 0x01, 0xeb, 0x28, 0x03 } }
> +
> +/*
> + * Read OTP memory
> + *
> + * [in]		value[0].a		OTP start offset in byte
> + * [in]		value[0].b		Access type (0:shadow, 1:fuse, 2:lock)
> + * [out]	memref[1].buffer	Output buffer to store read values
> + * [out]	memref[1].size		Size of OTP to be read
> + *
> + * Return codes:
> + * TEE_SUCCESS - Invoke command success
> + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> + * TEE_ERROR_ACCESS_DENIED - OTP not accessible by caller
> + */
> +#define PTA_BSEC_READ_MEM		0x0
> +
>  /*
> - * OTP status: bit 0 permanent lock
> + * Write OTP memory
> + *
> + * [in]		value[0].a		OTP start offset in byte
> + * [in]		value[0].b		Access type (0:shadow, 1:fuse, 2:lock)
> + * [in]		memref[1].buffer	Input buffer to read values
> + * [in]		memref[1].size		Size of OTP to be written
> + *
> + * Return codes:
> + * TEE_SUCCESS - Invoke command success
> + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> + * TEE_ERROR_ACCESS_DENIED - OTP not accessible by caller
>   */
> -#define BSEC_LOCK_PERM			BIT(0)
> +#define PTA_BSEC_WRITE_MEM		0x1
> +
> +/* value of PTA_BSEC access type = value[in] b */
> +#define SHADOW_ACCESS			0
> +#define FUSE_ACCESS			1
> +#define LOCK_ACCESS			2
>  
>  /**
>   * bsec_lock() - manage lock for each type SR/SP/SW
> @@ -359,6 +394,10 @@ struct stm32mp_bsec_plat {
>  	u32 base;
>  };
>  
> +struct stm32mp_bsec_priv {
> +	struct udevice *tee;
> +};
> +
>  static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>  {
>  	struct stm32mp_bsec_plat *plat;
> @@ -470,14 +509,109 @@ static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>  	return bsec_permanent_lock_otp(dev, plat->base, otp);
>  }
>  
> +static int bsec_pta_open_session(struct udevice *tee, u32 *tee_session)
> +{
> +	const struct tee_optee_ta_uuid uuid = PTA_BSEC_UUID;
> +	struct tee_open_session_arg arg;
> +	int rc;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	tee_optee_ta_uuid_to_octets(arg.uuid, &uuid);
> +	arg.clnt_login = TEE_LOGIN_REE_KERNEL;
> +	rc = tee_open_session(tee, &arg, 0, NULL);
> +	if (rc < 0)
> +		return -ENODEV;
> +
> +	*tee_session = arg.session;
> +
> +	return 0;
> +}
> +
> +static int bsec_optee_open(struct udevice *dev)
> +{
> +	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
> +	struct udevice *tee;
> +	u32 tee_session;
> +	int rc;
> +
> +	tee = tee_find_device(NULL, NULL, NULL, NULL);
> +	if (!tee)
> +		return -ENODEV;
> +
> +	/* try to open the STM32 BSEC TA */
> +	rc = bsec_pta_open_session(tee, &tee_session);
> +	if (rc)
> +		return rc;
> +
> +	tee_close_session(tee, tee_session);
> +
> +	priv->tee = tee;
> +
> +	return 0;
> +}
> +
> +static int bsec_optee_pta(struct udevice *dev, int cmd, int type, int offset,
> +			  void *buff, ulong size)
> +{
> +	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
> +	u32 tee_session;
> +	struct tee_invoke_arg arg;
> +	struct tee_param param[2];
> +	struct tee_shm *fw_shm;
> +	int rc;
> +
> +	rc = bsec_pta_open_session(priv->tee, &tee_session);
> +	if (rc)
> +		return rc;
> +
> +	rc = tee_shm_register(priv->tee, buff, size, 0, &fw_shm);
> +	if (rc)
> +		goto close_session;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	arg.func = cmd;
> +	arg.session = tee_session;
> +
> +	memset(param, 0, sizeof(param));
> +
> +	param[0].attr = TEE_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	param[0].u.value.a = offset;
> +	param[0].u.value.b = type;
> +
> +	if (cmd == PTA_BSEC_WRITE_MEM)
> +		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_INPUT;
> +	else
> +		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
> +
> +	param[1].u.memref.shm = fw_shm;
> +	param[1].u.memref.size = size;
> +
> +	rc = tee_invoke_func(priv->tee, &arg, 2, param);
> +	if (rc < 0 || arg.ret != 0) {
> +		dev_err(priv->tee,
> +			"PTA_BSEC invoke failed TEE err: %x, err:%x\n",
> +			arg.ret, rc);
> +		if (!rc)
> +			rc = -EIO;
> +	}
> +
> +	tee_shm_free(fw_shm);
> +
> +close_session:
> +	tee_close_session(priv->tee, tee_session);
> +
> +	return rc;
> +}
> +
>  static int stm32mp_bsec_read(struct udevice *dev, int offset,
>  			     void *buf, int size)
>  {
> +	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
>  	int ret;
>  	int i;
>  	bool shadow = true, lock = false;
>  	int nb_otp = size / sizeof(u32);
> -	int otp;
> +	int otp, cmd;
>  	unsigned int offs = offset;
>  
>  	if (offs >= STM32_BSEC_LOCK_OFFSET) {
> @@ -491,6 +625,19 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
>  	if ((offs % 4) || (size % 4))
>  		return -EINVAL;
>  
> +	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
> +		cmd = FUSE_ACCESS;
> +		if (shadow)
> +			cmd = SHADOW_ACCESS;
> +		if (lock)
> +			cmd = LOCK_ACCESS;
> +		ret = bsec_optee_pta(dev, PTA_BSEC_READ_MEM, cmd, offs, buf, size);
> +		if (ret)
> +			return ret;
> +
> +		return size;
> +	}
> +
>  	otp = offs / sizeof(u32);
>  
>  	for (i = otp; i < (otp + nb_otp) && i <= BSEC_OTP_MAX_VALUE; i++) {
> @@ -515,11 +662,12 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
>  static int stm32mp_bsec_write(struct udevice *dev, int offset,
>  			      const void *buf, int size)
>  {
> +	struct stm32mp_bsec_priv *priv = dev_get_priv(dev);
>  	int ret = 0;
>  	int i;
>  	bool shadow = true, lock = false;
>  	int nb_otp = size / sizeof(u32);
> -	int otp;
> +	int otp, cmd;
>  	unsigned int offs = offset;
>  
>  	if (offs >= STM32_BSEC_LOCK_OFFSET) {
> @@ -533,6 +681,19 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
>  	if ((offs % 4) || (size % 4))
>  		return -EINVAL;
>  
> +	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
> +		cmd = FUSE_ACCESS;
> +		if (shadow)
> +			cmd = SHADOW_ACCESS;
> +		if (lock)
> +			cmd = LOCK_ACCESS;
> +		ret = bsec_optee_pta(dev, PTA_BSEC_WRITE_MEM, cmd, offs, (void *)buf, size);
> +		if (ret)
> +			return ret;
> +
> +		return size;
> +	}
> +
>  	otp = offs / sizeof(u32);
>  
>  	for (i = otp; i < otp + nb_otp && i <= BSEC_OTP_MAX_VALUE; i++) {
> @@ -581,6 +742,9 @@ static int stm32mp_bsec_probe(struct udevice *dev)
>  			return ret;
>  	}
>  
> +	if (IS_ENABLED(CONFIG_OPTEE))
> +		bsec_optee_open(dev);
> +
>  	/*
>  	 * update unlocked shadow for OTP cleared by the rom code
>  	 * only executed in SPL, it is done in TF-A for TFABOOT
> @@ -607,6 +771,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
>  	.of_match = stm32mp_bsec_ids,
>  	.of_to_plat = stm32mp_bsec_of_to_plat,
>  	.plat_auto = sizeof(struct stm32mp_bsec_plat),
> +	.priv_auto = sizeof(struct stm32mp_bsec_priv),
>  	.ops = &stm32mp_bsec_ops,
>  	.probe = stm32mp_bsec_probe,
>  };
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 278253e472f5..85be8e23bdba 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -8,6 +8,7 @@
>  #include <console.h>
>  #include <log.h>
>  #include <misc.h>
> +#include <asm/arch/bsec.h>
>  #include <dm/device.h>
>  #include <dm/uclass.h>
>  
> @@ -84,9 +85,6 @@ static u32 get_otp_close_mask(void)
>  		return STM32_OTP_STM32MP15x_CLOSE_MASK;
>  }
>  
> -#define BSEC_LOCK_ERROR			(-1)
> -#define BSEC_LOCK_PERM			BIT(0)
> -
>  static int get_misc_dev(struct udevice **dev)
>  {
>  	int ret;
> diff --git a/arch/arm/mach-stm32mp/include/mach/bsec.h b/arch/arm/mach-stm32mp/include/mach/bsec.h
> index 252eac3946a4..10ebc535c4b5 100644
> --- a/arch/arm/mach-stm32mp/include/mach/bsec.h
> +++ b/arch/arm/mach-stm32mp/include/mach/bsec.h
> @@ -5,3 +5,10 @@
>  
>  /* check self hosted debug status = BSEC_DENABLE.DBGSWENABLE */
>  bool bsec_dbgswenable(void);
> +
> +/* Bitfield definition for LOCK status */
> +#define BSEC_LOCK_PERM			BIT(30)
> +#define BSEC_LOCK_SHADOW_R		BIT(29)
> +#define BSEC_LOCK_SHADOW_W		BIT(28)
> +#define BSEC_LOCK_SHADOW_P		BIT(27)
> +#define BSEC_LOCK_ERROR			BIT(26)
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index e12669b8628d..213fb5d30208 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -34,6 +34,7 @@
>  #include <command.h>
>  #include <console.h>
>  #include <misc.h>
> +#include <asm/arch/bsec.h>
>  #include <dm/device.h>
>  #include <dm/uclass.h>
>  
> @@ -109,7 +110,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  		else
>  			display_stboard(otp);
>  		printf("      OTP %d %s locked !\n", BSEC_OTP_BOARD,
> -		       lock == 1 ? "" : "NOT");
> +		       lock & BSEC_LOCK_PERM ? "" : "NOT");
>  		return CMD_RET_SUCCESS;
>  	}
>  
> @@ -178,7 +179,7 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  	}
>  
>  	/* write persistent lock */
> -	otp = 1;
> +	otp = BSEC_LOCK_PERM;
>  	ret = misc_write(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>  			 &otp, sizeof(otp));
>  	if (ret != sizeof(otp)) {
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index 3759df353ee5..9780ac9768cf 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -620,7 +620,7 @@ Prerequisite: check if a MAC address isn't yet programmed in OTP
>      STM32MP> env print ethaddr
>      ## Error: "ethaddr" not defined
>  
> -3) check lock status of fuse 57 & 58 (at 0x39, 0=unlocked, 1=locked)::
> +3) check lock status of fuse 57 & 58 (at 0x39, 0=unlocked, 0x40000000=locked)::
>  
>      STM32MP> fuse sense 0 0x10000039 2
>      Sensing bank 0:
> @@ -640,11 +640,11 @@ Example to set mac address "12:34:56:78:9a:bc"
>  
>  3) Lock OTP::
>  
> -    STM32MP> fuse prog 0 0x10000039 1 1
> +    STM32MP> fuse prog 0 0x10000039 0x40000000 0x40000000
>  
>      STM32MP> fuse sense 0 0x10000039 2
>      Sensing bank 0:
> -       Word 0x10000039: 00000001 00000001
> +       Word 0x10000039: 40000000 40000000
>  
>  4) next REBOOT, in the trace::
>  
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
