Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11621569B8E
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:28:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBE49C0D2BF;
	Thu,  7 Jul 2022 07:28:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2B99C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:28:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675nbr0029368;
 Thu, 7 Jul 2022 09:28:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iU4OmOrZUSfx1ItfgxrvmENdmvPUgg3nWuMu7tnzPvY=;
 b=N0a8iA0/3VqqkDDvfc1wzCmJPx4r9CZ29Npqjjk7dYy6A3/v25DZt92NgCPEethKFftw
 A+9V0enH8+8/f8DakSDMgENZ5ivqELcXKJvq/Jy0SAUFEg6nTgzQn9SxmbYiYRTEMOGR
 IDQkkthJP4B5fgr3v+ZUTLcy1cWJkJdUE5wv7PR32zN4pfSCquvfgx018fsYSQEgiai1
 e+uO/PHhNmxmVtVQqS+4FAPvC+bA+SYhUrYAb0VJwButWvcc/DOLwPByG0dXrt3bZ7A9
 z+V0LkifVdPEQZfNWspg5Fz4CP4FtqfFXXLMwl+DF5V8R2SPc+bd9lOIlGaXGdHUfiZS Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ubfawpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:28:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 632A310002A;
 Thu,  7 Jul 2022 09:28:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EF23210F92;
 Thu,  7 Jul 2022 09:28:56 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:28:56 +0200
Message-ID: <6ed6344e-3f50-2dae-1fb2-00c1b92c73f2@foss.st.com>
Date: Thu, 7 Jul 2022 09:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 01/10] i2c: stm32: add support for the
	st, stm32mp13 SOC
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

On 6/30/22 10:20, Patrick Delaunay wrote:
> The stm32mp13 soc differs from the stm32mp15 in terms of
> clear register offset for controlling the FMP (Fast Mode Plus).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/i2c/stm32f7_i2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index c6ae65badb7..bf2a6c9b4bd 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -267,6 +267,10 @@ static const struct stm32_i2c_data stm32mp15_data = {
>  	.fmp_clr_offset = 0x40,
>  };
>  
> +static const struct stm32_i2c_data stm32mp13_data = {
> +	.fmp_clr_offset = 0x4,
> +};
> +
>  static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
>  {
>  	struct stm32_i2c_regs *regs = i2c_priv->regs;
> @@ -957,6 +961,7 @@ static const struct dm_i2c_ops stm32_i2c_ops = {
>  static const struct udevice_id stm32_i2c_of_match[] = {
>  	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_data },
>  	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32mp15_data },
> +	{ .compatible = "st,stm32mp13-i2c", .data = (ulong)&stm32mp13_data },
>  	{}
>  };
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
