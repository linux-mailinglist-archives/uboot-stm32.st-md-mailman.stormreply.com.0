Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB05A5D2F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 09:43:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C96C5A4FD;
	Tue, 30 Aug 2022 07:43:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1430CC03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 07:43:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U4DhNO017626;
 Tue, 30 Aug 2022 09:43:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6uDyH96jLLWzRAQ54RCd9gZ8JCWLNpDFSwQUbNOkaI4=;
 b=UQSAKL3ZZmJnUNmgWZUzU88ZL+ERVL4vkcU2Zwe9uaB9zPkzox5X2W0e+i10nLQnBale
 0jWoFSiKaAPjj3sfFmeiUBkN3X7YZzWaV/e+S0oMu9Z0M0wpgk+inF4lRAYrltnxH9Ia
 gPxSDxfrX3f79waSlU5ziOTGrq9HihauO2XWw4NwpjcgEkV3Rpdib/m7IFWXhcvn3vSl
 7cMYYZj4aM1OKXeEvm9UCQteCtCT/uX6SwMF+QZl5Q+mUuWFiXIU+RL4yn3PwAP6neeG
 lHiuvC57QM+ySm+13CJLw3+C/yqujYTs8VmhylMtpLFOEAOvjzgx1RdLwq9M5Henkoh8 nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j78pk6bpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 09:43:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B59010002A;
 Tue, 30 Aug 2022 09:43:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C65721512A;
 Tue, 30 Aug 2022 09:43:37 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 09:43:35 +0200
Message-ID: <8530bf52-5e8a-c146-cf88-df97ec065410@foss.st.com>
Date: Tue, 30 Aug 2022 09:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, <hs@denx.de>,
 <patrice.chotard@foss.st.com>, <oleksandr.suvorov@foundries.io>
References: <20220815145211.31342-1-jorge@foundries.io>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220815145211.31342-1-jorge@foundries.io>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_04,2022-08-25_01,2022-06-22_01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/15/22 16:52, Jorge Ramirez-Ortiz wrote:
> Bits should be set to 0, not 1.
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>   drivers/i2c/stm32f7_i2c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index bf2a6c9b4b..3a727e68ac 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -413,7 +413,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
>   		setbits_le32(&regs->icr, STM32_I2C_ICR_STOPCF);
>   
>   		/* Clear control register 2 */
> -		setbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
> +		clrbits_le32(&regs->cr2, STM32_I2C_CR2_RESET_MASK);
>   	}
>   
>   	return ret;


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
