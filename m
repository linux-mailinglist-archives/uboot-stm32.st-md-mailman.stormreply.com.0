Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D95B1DA4
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 14:50:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8661CC64107;
	Thu,  8 Sep 2022 12:50:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 829B7C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 12:50:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288CZuT1011892;
 Thu, 8 Sep 2022 14:50:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zTuT4KZTKhwQdyawlY6QRpk31fNVuex6SaebPngXKQQ=;
 b=rekVb2OwxBaKZx2DVsnfFHGLJjWcKybU2sTe9lm0onjJROF9ppRZA/CKqzqJtR3s4IAA
 thLtXUuNX/XNbOAzgR4oO/QjQ0Gq8E54dBHvLbIPcD8YLZkZAaXeaPT1j0drGknmGmGc
 OFyxJPdVkI3XuF5F+ku0TDDH3KXHgUQm+yDnHxYU5YeN2kgr0pqJwZWyNFDsVi5peII5
 r3iKg6j9vzkPUw0UUrRTQnTGUEMq1SbB4NCUQbKvLGImNwapKu1hYitynZHhVF/r1Y4R
 nEMxAoHOsGpsPh2qDwZXN4TO2XfzNV6jt3kTFCYfvK/A1lMNjeoG+Oxa93gzWVrTf20p 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbnpnyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 14:50:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C83210002A;
 Thu,  8 Sep 2022 14:50:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 982E822A6DE;
 Thu,  8 Sep 2022 14:50:14 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 14:50:11 +0200
Message-ID: <713dcf62-706b-8a9c-6893-e1b2d71cd1af@foss.st.com>
Date: Thu, 8 Sep 2022 14:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-3-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220908105934.1764482-3-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_08,2022-09-07_02,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] i2c: stm32: remove unused stop
 parameter in start & reload handling
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

Hi,

On 9/8/22 12:59, Alain Volmat wrote:
> Functions stm32_i2c_message_start and stm32_i2c_handle_reload
> both get a stop boolean indicating if the transfer should end with
> a STOP or not.  However no specific handling is needed in those
> functions hence remove the parameter.
>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>   drivers/i2c/stm32f7_i2c.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 78d7156492..0ec67b5c12 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -282,7 +282,7 @@ static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
>   }
>   
>   static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
> -				    struct i2c_msg *msg, bool stop)
> +				    struct i2c_msg *msg)
>   {
>   	struct stm32_i2c_regs *regs = i2c_priv->regs;
>   	u32 cr2 = readl(&regs->cr2);
> @@ -325,7 +325,7 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
>    */
>   
>   static void stm32_i2c_handle_reload(struct stm32_i2c_priv *i2c_priv,
> -				    struct i2c_msg *msg, bool stop)
> +				    struct i2c_msg *msg)
>   {
>   	struct stm32_i2c_regs *regs = i2c_priv->regs;
>   	u32 cr2 = readl(&regs->cr2);
> @@ -431,7 +431,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>   	/* Add errors */
>   	mask |= STM32_I2C_ISR_ERRORS;
>   
> -	stm32_i2c_message_start(i2c_priv, msg, stop);
> +	stm32_i2c_message_start(i2c_priv, msg);
>   
>   	while (msg->len) {
>   		/*
> @@ -469,7 +469,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>   			mask = msg->flags & I2C_M_RD ? STM32_I2C_ISR_RXNE :
>   			       STM32_I2C_ISR_TXIS | STM32_I2C_ISR_NACKF;
>   
> -			stm32_i2c_handle_reload(i2c_priv, msg, stop);
> +			stm32_i2c_handle_reload(i2c_priv, msg);
>   		} else if (!bytes_to_rw) {
>   			/* Wait until TC flag is set */
>   			mask = STM32_I2C_ISR_TC;


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
