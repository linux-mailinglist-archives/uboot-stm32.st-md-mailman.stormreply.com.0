Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8F59FE6C
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Aug 2022 17:35:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D2E0C6410D;
	Wed, 24 Aug 2022 15:35:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2E30C6410C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 15:35:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OBa4rd023729;
 Wed, 24 Aug 2022 17:35:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yIjSd7q2j5L0/9INFenmvNHwKztMGDMnrUxCP/2GILU=;
 b=xahFLQ65oLRQltIoWaH20DyeqyK9XtPYJcacK2B3xsYe71+7fqg6PtizZLKfj0FwFSoz
 XQUu3F68VLE2zDTEwByMI8IM8D+xFu1Aq64rrrLnAi5q5jrLJyEtdqYXGAAnR1/eQHrv
 YVyyZQ8LsfT3DIXrFbtoP34qO4PDUq3NXGviAIKAojOgtIcOui8jdUTesmV1Jr+DSHOb
 oStkkDMfkoa8NyoAzaUGVn3+418H3uY6nt17aska9jw+cGr1y31Z9WXk6/ZznKc3kWZ/
 Ms2I+vxra20wS0dzY3DRCO7DnreZmuGyWa6FlZnOUDFxZ27MeNe8r3ziSGLnRnOqQD+x XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j58m5d8qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 17:35:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4744F10002A;
 Wed, 24 Aug 2022 17:35:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40796237D94;
 Wed, 24 Aug 2022 17:35:09 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 24 Aug
 2022 17:35:08 +0200
Message-ID: <1be010a7-8ecc-c102-ff74-7e4380865bd4@foss.st.com>
Date: Wed, 24 Aug 2022 17:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, <hs@denx.de>,
 <patrick.delaunay@foss.st.com>, <oleksandr.suvorov@foundries.io>
References: <20220815145211.31342-1-jorge@foundries.io>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220815145211.31342-1-jorge@foundries.io>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_09,2022-08-22_02,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCHv2 1/2] i2c: stm32f7: fix clearing the
	control register
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

Hi Jorge

On 8/15/22 16:52, Jorge Ramirez-Ortiz wrote:
> Bits should be set to 0, not 1.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>  drivers/i2c/stm32f7_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index bf2a6c9b4b..3a727e68ac 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -413,7 +413,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
>  		setbits_le32(&regs->icr, STM32_I2C_ICR_STOPCF);
>  
>  		/* Clear control register 2 */
> -		setbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
> +		clrbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
>  	}
>  
>  	return ret;


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
