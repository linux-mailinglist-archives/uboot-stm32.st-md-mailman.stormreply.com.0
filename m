Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA34E4183
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 15:38:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF31CC5EC6B;
	Tue, 22 Mar 2022 14:38:36 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518CCC5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647959912;
 bh=qTB9KiFm4u3uzqQXxYAEe6OmHltye/UbKCY4IeXDbHk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bBbfan4ZalcZK+j8stMqnKeBCUgJgCStvhqe4MpdANPGSnVCoxiFgP2ApYA+kowMP
 RQDmwqELh+NM0hDbEqUpIBsWvFhJ1DDDWUCyf3H+5xtspRLPO1rYsYelyFNWPZsNEL
 4dpZ3Nk9Yc7hRpOowkNraaRSIXDR+8pGgkgRmoRo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.67] ([88.152.144.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1nuTwH2UkT-00kchp; Tue, 22
 Mar 2022 15:38:32 +0100
Message-ID: <30f14c6e-bc88-40cf-49b8-d2beecbf0ee8@gmx.de>
Date: Tue, 22 Mar 2022 15:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
X-Provags-ID: V03:K1:XSXGDajCoPVF7gzQw/68lE8jlG+j46ShyWxN22d6Tt0YB0CALEV
 fMVG9hhvPGC2njBre76TOrRWj5vr2Nm2PtnoaG2XFnKOtutSyhZf7tpzQ9oBL7ti9Iw1we5
 s6SwW9I4FHlUp17gxnPPUJUwpR8TDMcIJvR0ijttQYHEYDjiRcekFJlR3JUhaMknn8kGmLM
 wnEdchfmMTKVTCO6ojQDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7/ajMni4h4o=:V/4Vj5pte496YJQXIRm/O0
 6YdE2eRFBsQ6VVvG204TDqQABUIQI5TDVa3pj+Xoz2FiZKGdi+hi4SPCwsV1ZQv5bowjVYXAr
 23Vyj8xhXxtE6Xs2hmKul3LUIdixJ9qZm53iFs6EOoRe/4SYVgSV3kHqL5v+jDC2vmjI9zqWc
 tfCzehsOuhSK9vHZJgYjhLqnhrUXHlAA5p5eg+2t0jxt+lgM7YBq6egqYLfVsZPcFG5AOLFfM
 wpCWojfnEe9Td6JLjs7tuaCVx9K+V82U+GEQh/IjlMc1gAVDFRAxBh0Z7eaojr2F6g6S4GGqF
 z3brna15rHfoCr0M/Qk7LexXJdrg5tGRWCtE+4Q32oNx3DVGF5fFN04GDsYQkl+Of+HOitECF
 GXI3vFfgA3dBZrSvOlY99Cn/j3KgLADT83QJRt2cXslABHUEsQr5gHYrnPmB433x03A2SOD42
 coF9hUB88jQWC0zGU7JY+oh+hq49tVK2AmsYfNFqAuujUv3uBfEpYkLuVX7B6nXt1CEh4W2pK
 bBH1J5kgHKV5OYpwH41F8ljJ50oYmwUU+ckXY0h7BgWXhSLWV8JJWL3acz10vBkp/9+3N6Yyi
 KgePY6h7lIgwM4i+Ajzu3B+mFBTtF00Dm6/zPC9/4toi6bcefGFNIskAsjQj1eXggDaA9JAvN
 VH7Lvh+6wGbTW2YTZuGEw0s6mcRVIAZGO7RMsKYOKmbJNGe8Tfu1hsmYm47WIXQ3hO9WGjZxv
 5m5S8tyScLxyGSxW8vhFrHsPTPBFiuW3lFZS++pcKRvaHJ4QcT45gKMlQZWvist6iCFrXZpvE
 XnNEUPgzc+6qnspCN7C+l+96EvNoWNtNcFbRnWid/iafsb6ON5NN448M+u1+seAhT5T6K9mX0
 zDwZ4zTxiLt8RhmiBC46zXLL9oxZA3fL8pwWJA6Io1ae5K3zIRfxTc4W6tny+S20MGrwgy7QD
 Fzp1ocrG67Z6FRfP8k9k/zR1c/ftjfO4v3IY+4sIzXDeKgeZRYgP4NbXgRmIB3rjEUcTeXDB0
 EZwxNzdzzP7iVlClT7yOugVikTxBMRR+nDF2k7HmptUtV/czZullSOq/YafVkKA2eHnIhufTN
 wNq0NtHEpjxgyA=
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/3] rng: add OP-TEE based Random Number
	Generator
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 3/22/22 15:06, Patrick Delaunay wrote:
> Add driver for OP-TEE based Random Number Generator on ARM SoCs
> where hardware entropy sources are not accessible to normal world
> and the RNG service is provided by a HWRNG Trusted Application (TA).
>
> This driver is based on the linux driver: char/hw_random/optee-rng.c
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   MAINTAINERS             |   1 +
>   drivers/rng/Kconfig     |   8 +++
>   drivers/rng/Makefile    |   1 +
>   drivers/rng/optee_rng.c | 156 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 166 insertions(+)
>   create mode 100644 drivers/rng/optee_rng.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f25ca7cd00..3356c65dd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -481,6 +481,7 @@ F:	drivers/power/regulator/stpmic1.c
>   F:	drivers/ram/stm32mp1/
>   F:	drivers/remoteproc/stm32_copro.c
>   F:	drivers/reset/stm32-reset.c
> +F:	drivers/rng/optee_rng.c
>   F:	drivers/rng/stm32mp1_rng.c
>   F:	drivers/rtc/stm32_rtc.c
>   F:	drivers/serial/serial_stm32.*
> diff --git a/drivers/rng/Kconfig b/drivers/rng/Kconfig
> index b1c5ab93d1..a02c585f61 100644
> --- a/drivers/rng/Kconfig
> +++ b/drivers/rng/Kconfig
> @@ -31,6 +31,14 @@ config RNG_MSM
>   	  This driver provides support for the Random Number
>   	  Generator hardware found on Qualcomm SoCs.
>
> +config RNG_OPTEE
> +	bool "OP-TEE based Random Number Generator support"
> +	depends on DM_RNG && OPTEE
> +	help
> +	  This driver provides support for OP-TEE based Random Number
> +	  Generator on ARM SoCs where hardware entropy sources are not
> +	  accessible to normal world.


https://optee.readthedocs.io/en/latest/architecture/porting_guidelines.html
has:

"By default OP-TEE is configured with a software PRNG. The entropy is
added to software PRNG at various places, but unfortunately it is still
quite easy to predict the data added as entropy. As a consequence,
unless the RNG is based on hardware the generated random will be quite
weak."

Having a similiar warning in the long text for the CONFIG_RNG_OPTEE
symbol would be helpful.

> +
>   config RNG_STM32MP1
>   	bool "Enable random number generator for STM32MP1"
>   	depends on ARCH_STM32MP
> diff --git a/drivers/rng/Makefile b/drivers/rng/Makefile
> index 39f7ee3f03..435b3b965a 100644
> --- a/drivers/rng/Makefile
> +++ b/drivers/rng/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_DM_RNG) += rng-uclass.o
>   obj-$(CONFIG_RNG_MESON) += meson-rng.o
>   obj-$(CONFIG_RNG_SANDBOX) += sandbox_rng.o
>   obj-$(CONFIG_RNG_MSM) += msm_rng.o
> +obj-$(CONFIG_RNG_OPTEE) += optee_rng.o
>   obj-$(CONFIG_RNG_STM32MP1) += stm32mp1_rng.o
>   obj-$(CONFIG_RNG_ROCKCHIP) += rockchip_rng.o
>   obj-$(CONFIG_RNG_IPROC200) += iproc_rng200.o
> diff --git a/drivers/rng/optee_rng.c b/drivers/rng/optee_rng.c
> new file mode 100644
> index 0000000000..a0833d0862
> --- /dev/null
> +++ b/drivers/rng/optee_rng.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + */
> +#define LOG_CATEGORY UCLASS_RNG
> +
> +#include <common.h>
> +
> +#include <rng.h>
> +#include <tee.h>
> +#include <dm/device.h>
> +#include <dm/device_compat.h>
> +#include <linux/sizes.h>
> +
> +#define TEE_ERROR_HEALTH_TEST_FAIL	0x00000001
> +
> +/*
> + * TA_CMD_GET_ENTROPY - Get Entropy from RNG
> + *
> + * param[0] (inout memref) - Entropy buffer memory reference
> + * param[1] unused
> + * param[2] unused
> + * param[3] unused
> + *
> + * Result:
> + * TEE_SUCCESS - Invoke command success
> + * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
> + * TEE_ERROR_NOT_SUPPORTED - Requested entropy size greater than size of pool
> + * TEE_ERROR_HEALTH_TEST_FAIL - Continuous health testing failed
> + */
> +#define TA_CMD_GET_ENTROPY		0x0
> +
> +#define MAX_ENTROPY_REQ_SZ		SZ_4K
> +
> +#define TA_HWRNG_UUID { 0xab7a617c, 0xb8e7, 0x4d8f, \
> +			{ 0x83, 0x01, 0xd0, 0x9b, 0x61, 0x03, 0x6b, 0x64 } }
> +
> +/**
> + * struct optee_rng_priv - OP-TEE Random Number Generator private data
> + * @session_id:		RNG TA session identifier.
> + */
> +struct optee_rng_priv {
> +	u32 session_id;
> +};
> +

Please, provide as Sphinx style function description.

> +static int get_optee_rng_data(struct udevice *dev,
> +			      struct tee_shm *entropy_shm_pool,
> +			      void *buf, size_t *size)
> +{
> +	struct optee_rng_priv *priv = dev_get_priv(dev);
> +	int ret = 0;
> +	struct tee_invoke_arg arg;

Wouldn't it be preferable to use

struct tee_invoke_arg arg = { 0 }; ?

This way the compiler can optimize the initialization and set all 0
initialized variables with a single memset() call.

Best regards

Heinrich

> +	struct tee_param param;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	memset(&param, 0, sizeof(param));
> +
> +	/* Invoke TA_CMD_GET_ENTROPY function of Trusted App */
> +	arg.func = TA_CMD_GET_ENTROPY;
> +	arg.session = priv->session_id;
> +
> +	/* Fill invoke cmd params */
> +	param.attr = TEE_PARAM_ATTR_TYPE_MEMREF_INOUT;
> +	param.u.memref.shm = entropy_shm_pool;
> +	param.u.memref.size = *size;
> +
> +	ret = tee_invoke_func(dev->parent, &arg, 1, &param);
> +	if (ret || arg.ret) {
> +		if (!ret)
> +			ret = -EPROTO;
> +		dev_err(dev, "TA_CMD_GET_ENTROPY invoke err: %d 0x%x\n", ret, arg.ret);
> +		*size = 0;
> +
> +		return ret;
> +	}
> +
> +	memcpy(buf, param.u.memref.shm->addr, param.u.memref.size);
> +	*size = param.u.memref.size;
> +
> +	return 0;
> +}
> +
> +static int optee_rng_read(struct udevice *dev, void *buf, size_t len)
> +{
> +	size_t read = 0, rng_size = 0;
> +	struct tee_shm *entropy_shm_pool;
> +	u8 *data = buf;
> +	int ret;
> +
> +	ret = tee_shm_alloc(dev->parent, MAX_ENTROPY_REQ_SZ, 0, &entropy_shm_pool);
> +	if (ret) {
> +		dev_err(dev, "tee_shm_alloc failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	while (read < len) {
> +		rng_size = min(len - read, (size_t)MAX_ENTROPY_REQ_SZ);
> +		ret = get_optee_rng_data(dev, entropy_shm_pool, data, &rng_size);
> +		if (ret)
> +			goto shm_free;
> +		data += rng_size;
> +		read += rng_size;
> +	}
> +
> +shm_free:
> +	tee_shm_free(entropy_shm_pool);
> +
> +	return ret;
> +}
> +
> +static int optee_rng_probe(struct udevice *dev)
> +{
> +	const struct tee_optee_ta_uuid uuid = TA_HWRNG_UUID;
> +	struct optee_rng_priv *priv = dev_get_priv(dev);
> +	struct tee_open_session_arg sess_arg;
> +	int ret;
> +
> +	memset(&sess_arg, 0, sizeof(sess_arg));
> +
> +	/* Open session with hwrng Trusted App */
> +	tee_optee_ta_uuid_to_octets(sess_arg.uuid, &uuid);
> +	sess_arg.clnt_login = TEE_LOGIN_PUBLIC;
> +
> +	ret = tee_open_session(dev->parent, &sess_arg, 0, NULL);
> +	if (ret || sess_arg.ret) {
> +		if (!ret)
> +			ret = -EIO;
> +		dev_err(dev, "can't open session: %d 0x%x\n", ret, sess_arg.ret);
> +		return ret;
> +	}
> +	priv->session_id = sess_arg.session;
> +
> +	return 0;
> +}
> +
> +static int optee_rng_remove(struct udevice *dev)
> +{
> +	struct optee_rng_priv *priv = dev_get_priv(dev);
> +
> +	tee_close_session(dev->parent, priv->session_id);
> +
> +	return 0;
> +}
> +
> +static const struct dm_rng_ops optee_rng_ops = {
> +	.read = optee_rng_read,
> +};
> +
> +U_BOOT_DRIVER(optee_rng) = {
> +	.name = "optee-rng",
> +	.id = UCLASS_RNG,
> +	.ops = &optee_rng_ops,
> +	.probe = optee_rng_probe,
> +	.remove = optee_rng_remove,
> +	.priv_auto = sizeof(struct optee_rng_priv),
> +};

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
