Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFBC4E9A5
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:41:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30654CA75C3
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:41:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC0F0CA75C2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:41:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDeAf0000552; Fri, 21 Jun 2019 15:41:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=X2x6H70r65C+fNJBafisdMpaSps+hRCXboB3bzR0/eY=;
 b=kIq9MzXXiy1VpfZ4Fujr8XULu2mTNDC/NM9K7eoYPzBjV0s0Pn33GglacCPWenqWeo6T
 Wy6q44rtcDZjX+qx5zMDs0TI5h7tX3zLRdEq3bSNheGORJ+i4H6FoiIuewMjGndUK3lA
 ObpVlvvJpSCWkGac7zqwWLFMHO0QLigRtILY2U41XJz7q+jqGpHJOTGJYZtXQSz+yVqF
 +FVYZtdfB0PnNOtkPXtBL0uJPb1tjtnsxmcialohyzsKw5d+gz8DzpCOmIJ4DtdnWk3+
 HD/jgPGm5tssBCfQrQIidskrfEp+zfKwnYUVKjtagzZLzUJXQwYNaE8VUOrdtCUwY+fo zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137w2g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:41:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5E7834;
 Fri, 21 Jun 2019 13:41:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CC442A85;
 Fri, 21 Jun 2019 13:41:29 +0000 (GMT)
Received: from [10.48.0.167] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Jun
 2019 15:41:29 +0200
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-7-git-send-email-patrick.delaunay@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <d9b51213-d223-a369-837c-53bb53ec494a@st.com>
Date: Fri, 21 Jun 2019 15:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561123618-2029-7-git-send-email-patrick.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 07/20] adc: stm32: Fix warnings when
	compiling with W=1
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

On 6/21/19 3:26 PM, Patrick Delaunay wrote:
> This patch solves the following warnings:
> 
> drivers/adc/stm32-adc-core.c: In function 'stm32h7_adc_clk_sel':
> warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
>    for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>                  ^
> warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
>   for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
>                 ^
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Hi Patrick,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> ---
> 
>  drivers/adc/stm32-adc-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/adc/stm32-adc-core.c b/drivers/adc/stm32-adc-core.c
> index a9aa143..04b6a8a 100644
> --- a/drivers/adc/stm32-adc-core.c
> +++ b/drivers/adc/stm32-adc-core.c
> @@ -60,7 +60,8 @@ static int stm32h7_adc_clk_sel(struct udevice *dev,
>  {
>  	u32 ckmode, presc;
>  	unsigned long rate;
> -	int i, div;
> +	unsigned int i;
> +	int div;
>  
>  	/* stm32h7 bus clock is common for all ADC instances (mandatory) */
>  	if (!clk_valid(&common->bclk)) {
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
