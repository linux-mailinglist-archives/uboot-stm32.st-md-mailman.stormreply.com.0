Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002B200A1
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 09:49:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29D7BC35E03
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 07:49:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6218C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2019 07:49:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G7lgin010244; Thu, 16 May 2019 09:49:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8dS2PFn9jbtsxHmdEAJ37v5WuKG/HrszZvtc+GIUvTo=;
 b=wbSEyh9V4ZPJr6NsW16Os1kE/sYcS0bF4XBjglulE2uS8/RHuBVkYr87DpGgURXvLfDA
 Nl9EhFIixLWCRuuEKObqDh3OWgXpGBJhOt1cXjGnu9gNKvRtnmAuXbI8IpguhCJc+Vpu
 JcoHV3JUxHLUoqKnhtH3r4T1DayykpqqUp6Fcisxci/qjcnaZr4tQVp8WIg7pf75Ye3V
 +eNLGPQ9UAOTDoVB8Z4Qjp5ylnQQeINGpGiAPG2q0Ppoc1DKCJ6Y77v2M36jMPAw9ssb
 YkzsiQkPbxsWAPvO0MjdS4bufZsHsrea5WTHCIptmXPzM5pqrt6YgY5p+CJ38b0AkLl2 Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv05f9r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 May 2019 09:49:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF39E41;
 Thu, 16 May 2019 07:49:17 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AE011487;
 Thu, 16 May 2019 07:49:17 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 May
 2019 09:49:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 16 May 2019 09:49:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Thread-Topic: [PATCH 1/4] mailbox: introduce stm32-ipcc driver
Thread-Index: AQHVCjZT9v0DZiVDWUCeavu7CRrNtKZtQcIA
Date: Thu, 16 May 2019 07:49:16 +0000
Message-ID: <ebcf1908-1d10-6107-deb1-1a1a529da61b@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-2-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <A2017EF01A38F54280916D40D2609489@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_06:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/4] mailbox: introduce stm32-ipcc driver
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

Hi Fabien

On 5/14/19 11:20 AM, Fabien Dessenne wrote:
> On STM32 family, the IPCC peripheral allows the communication
> between 2 processors offering doorbells mechanism.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/mailbox/Kconfig      |   7 ++
>  drivers/mailbox/Makefile     |   1 +
>  drivers/mailbox/stm32-ipcc.c | 167 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+)
>  create mode 100644 drivers/mailbox/stm32-ipcc.c
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 2836ee4..11bf552 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -24,6 +24,13 @@ config TEGRA_HSP
>  	  This enables support for the NVIDIA Tegra HSP Hw module, which
>  	  implements doorbells, mailboxes, semaphores, and shared interrupts.
>  
> +config STM32_IPCC
> +	bool "Enable STM32 IPCC controller support"
> +	depends on DM_MAILBOX && ARCH_STM32MP
> +	help
> +	  This enables support for the STM32MP IPCC Hw module, which
> +	  implements doorbells between 2 processors.
> +
>  config K3_SEC_PROXY
>  	bool "Texas Instruments K3 Secure Proxy Driver"
>  	depends on DM_MAILBOX && ARCH_K3
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index cd23769..a753cc4 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -6,5 +6,6 @@
>  obj-$(CONFIG_$(SPL_)DM_MAILBOX) += mailbox-uclass.o
>  obj-$(CONFIG_SANDBOX_MBOX) += sandbox-mbox.o
>  obj-$(CONFIG_SANDBOX_MBOX) += sandbox-mbox-test.o
> +obj-$(CONFIG_STM32_IPCC) += stm32-ipcc.o
>  obj-$(CONFIG_TEGRA_HSP) += tegra-hsp.o
>  obj-$(CONFIG_K3_SEC_PROXY) += k3-sec-proxy.o
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> new file mode 100644
> index 0000000..c3df967
> --- /dev/null
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <clk.h>
> +#include <dm.h>
> +#include <mailbox-uclass.h>
> +#include <asm/io.h>
> +
> +/*
> + * IPCC has one set of registers per CPU
> + * IPCC_PROC_OFFST allows to define cpu registers set base address
> + * according to the assigned proc_id.
> + */
> +
> +#define IPCC_PROC_OFFST		0x010
> +
> +#define IPCC_XSCR		0x008
> +#define IPCC_XTOYSR		0x00c
> +
> +#define IPCC_HWCFGR		0x3f0
> +#define IPCFGR_CHAN_MASK	GENMASK(7, 0)
> +
> +#define RX_BIT_CHAN(chan)	BIT(chan)
> +#define TX_BIT_SHIFT		16
> +#define TX_BIT_CHAN(chan)	BIT(TX_BIT_SHIFT + (chan))
> +
> +#define STM32_MAX_PROCS		2
> +
> +struct stm32_ipcc {
> +	void __iomem *reg_base;
> +	void __iomem *reg_proc;
> +	u32 proc_id;
> +	u32 n_chans;
> +};
> +
> +static int stm32_ipcc_request(struct mbox_chan *chan)
> +{
> +	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
> +
> +	debug("%s(chan=%p)\n", __func__, chan);
> +
> +	if (chan->id >= ipcc->n_chans) {
> +		debug("%s failed to request channel: %ld\n",
> +		      __func__, chan->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32_ipcc_free(struct mbox_chan *chan)
> +{
> +	debug("%s(chan=%p)\n", __func__, chan);
> +
> +	return 0;
> +}
> +
> +static int stm32_ipcc_send(struct mbox_chan *chan, const void *data)
> +{
> +	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
> +
> +	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
> +
> +	if (readl(ipcc->reg_proc + IPCC_XTOYSR) & BIT(chan->id))
> +		return -EBUSY;
> +
> +	/* set channel n occupied */
> +	setbits_le32(ipcc->reg_proc + IPCC_XSCR, TX_BIT_CHAN(chan->id));
> +
> +	return 0;
> +}
> +
> +static int stm32_ipcc_recv(struct mbox_chan *chan, void *data)
> +{
> +	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
> +	u32 val;
> +	int proc_offset;
> +
> +	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
> +
> +	/* read 'channel occupied' status from other proc */
> +	proc_offset = ipcc->proc_id ? -IPCC_PROC_OFFST : IPCC_PROC_OFFST;
> +	val = readl(ipcc->reg_proc + proc_offset + IPCC_XTOYSR);
> +
> +	if (!(val & BIT(chan->id)))
> +		return -ENODATA;
> +
> +	setbits_le32(ipcc->reg_proc + IPCC_XSCR, RX_BIT_CHAN(chan->id));
> +
> +	return 0;
> +}
> +
> +static int stm32_ipcc_probe(struct udevice *dev)
> +{
> +	struct stm32_ipcc *ipcc = dev_get_priv(dev);
> +	fdt_addr_t addr;
> +	const fdt32_t *cell;
> +	struct clk clk;
> +	int len, ret;
> +
> +	debug("%s(dev=%p)\n", __func__, dev);
> +
> +	addr = dev_read_addr(dev);
> +	if (addr == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	ipcc->reg_base = (void __iomem *)addr;
> +
> +	/* proc_id */
> +	cell = dev_read_prop(dev, "st,proc_id", &len);
> +	if (len < sizeof(fdt32_t)) {
> +		dev_dbg(dev, "Missing st,proc_id\n");
> +		return -EINVAL;
> +	}
> +
> +	ipcc->proc_id = fdtdec_get_number(cell, 1);
> +
> +	if (ipcc->proc_id >= STM32_MAX_PROCS) {
> +		dev_err(dev, "Invalid proc_id (%d)\n", ipcc->proc_id);
> +		return -EINVAL;
> +	}
> +
> +	ipcc->reg_proc = ipcc->reg_base + ipcc->proc_id * IPCC_PROC_OFFST;
> +
> +	ret = clk_get_by_index(dev, 0, &clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable(&clk);
> +	if (ret)
> +		goto clk_free;
> +
> +	/* get channel number */
> +	ipcc->n_chans = readl(ipcc->reg_base + IPCC_HWCFGR);
> +	ipcc->n_chans &= IPCFGR_CHAN_MASK;
> +
> +	return 0;
> +
> +clk_free:
> +	clk_free(&clk);
> +
> +	return ret;
> +}
> +
> +static const struct udevice_id stm32_ipcc_ids[] = {
> +	{ .compatible = "st,stm32mp1-ipcc" },
> +	{ }
> +};
> +
> +struct mbox_ops stm32_ipcc_mbox_ops = {
> +	.request = stm32_ipcc_request,
> +	.free = stm32_ipcc_free,
> +	.send = stm32_ipcc_send,
> +	.recv = stm32_ipcc_recv,
> +};
> +
> +U_BOOT_DRIVER(stm32_ipcc) = {
> +	.name = "stm32_ipcc",
> +	.id = UCLASS_MAILBOX,
> +	.of_match = stm32_ipcc_ids,
> +	.probe = stm32_ipcc_probe,
> +	.priv_auto_alloc_size = sizeof(struct stm32_ipcc),
> +	.ops = &stm32_ipcc_mbox_ops,
> +};
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
