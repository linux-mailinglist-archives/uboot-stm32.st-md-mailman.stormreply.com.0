Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA7520F36
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:56:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DEDFC0D2B9;
	Tue, 10 May 2022 07:56:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C758C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:56:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A2NdME023980;
 Tue, 10 May 2022 09:29:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nXAeCkPqvcEazJdLkGLNJb1kOOu0v64nqB+z+DnTUYk=;
 b=ODW9LpnTuoLa3CfNQYEzlC1UkK2A668i4c+vBqmhwseDhocNkdDPcfdvaP9ZXqjhtzON
 MmlYNtGWIl53CEfp+Toqmrc8gKfaVurAvhNUkcfLktcIZtMw0K1PxvyLsRkRYfzZXWr4
 2yid1qmVsPIF+rnuZs2n1/2+Lc8tW7qfUROeBRrGqrNqbWSZwxtBUqZrY+g4auPuDXK1
 vmruSoF8E+8VplfvNAwrjOrz+DFpVn4M/8ZJRF1gFhG0nstTdikjnbrphy84ow1E0FUa
 GiFbn1Nno/z2gcCvQz4PH4nQdp+WicZBXZonVpn6PbqypvatS10JYcM/LL8g3oRNlm3z IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw90e9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:29:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDF3410002A;
 Tue, 10 May 2022 09:29:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C751C212315;
 Tue, 10 May 2022 09:29:55 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:29:55 +0200
Message-ID: <a2e62d4a-e476-8fde-e875-1f072cebdd4c@foss.st.com>
Date: Tue, 10 May 2022 09:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.6.Ie76b6efe731c9d721b794d9ad6b394b38492a4df@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.6.Ie76b6efe731c9d721b794d9ad6b394b38492a4df@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_06,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/8] stm32mp: stm32prog: handle
 interruption during the first enumeration
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



On 3/28/22 19:25, Patrick Delaunay wrote:
> When an interruption is received during the first USB enumeration
> used to received the FlashLayout, with handle ctrl-c, the second
> enumeration is not needed and the result for stm32prog_usb_loop
> is false (reset is not needed).
> 
> This patch avoids the need of a second ctrl to interrupt the command
> stm32prog.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index 82b702f93b..a8b57c4d8f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -206,9 +206,12 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
>  	g_dnl_set_product(product);
>  
>  	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
> +		/* forget any previous Control C */
> +		clear_ctrlc();
>  		ret = run_usb_dnl_gadget(dev, "usb_dnl_dfu");
> -		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT)
> -			return ret;
> +		/* DFU reset received, no error or CtrlC */
> +		if (ret || stm32prog_data->phase != PHASE_FLASHLAYOUT || had_ctrlc())
> +			return ret; /* true = reset on DFU error */
>  		/* prepare the second enumeration with the FlashLayout */
>  		stm32prog_dfu_init(data);
>  	}

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
