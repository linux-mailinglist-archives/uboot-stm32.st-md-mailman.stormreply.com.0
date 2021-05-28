Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C31394306
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:54:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F155C5718D;
	Fri, 28 May 2021 12:54:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E10C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:54:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqNFF009644; Fri, 28 May 2021 14:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ml4hX7cpFnMMMZReMvrVacYRHNXNWXs12jW4FXm/RXw=;
 b=nCh/61NM4urzoXpWhIvx4B9JEtUodQA8K7OGpEIJvAOtoHogHuy7UOg4/crDGyeZmWXc
 rTxo1cmj6blqhKTiSlexuL95Lg8rKNVWaLERaBZ9yzlNLlbi7Cd8JEU5FYRV60RLVSKF
 X2uWOU48CcMYu4M1UiR5Dad+806k8sGVnTM7GPByFoK2/MlkkiL0LrYHcCnBF0qQmtaO
 n9CKevBIV1MK7+f/PqhjdKRAzCgVRuUnFEACoMKT/TWhcZ2qeZ1IBj2gG3NzczyruTEc
 gLqmq/WygSD2N4mrT5G+jipIuJyPenXOEkCLt/FNNNfYVqYPGptvqrwQ7ekQKFSOCZB7 qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38ttn02am7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:54:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2280C100034;
 Fri, 28 May 2021 14:54:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 178412291B4;
 Fri, 28 May 2021 14:54:30 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:54:29 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.8.I356522a80eec573678c8a84e06f1dbba4b380f29@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <398944f2-fcf8-ab6c-6d35-c4fb4f9588ae@foss.st.com>
Date: Fri, 28 May 2021 14:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.8.I356522a80eec573678c8a84e06f1dbba4b380f29@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 08/10] stm32mp: stm32prog: change one
 message level to debug
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

On 5/18/21 3:12 PM, Patrick Delaunay wrote:
> Move the message "Invalid or missing layout file."
> to debug level as it is a normal behavior and not an error
> and add the missing '\n'.
> 
> This patch avoids the strange trace :
>   Boot over usb0!
>   Invalid or missing layout file.DFU alt info setting: done
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index f3790f900f..feff73c79e 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -99,7 +99,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  
>  	ret = stm32prog_init(data, addr, size);
>  	if (ret)
> -		printf("Invalid or missing layout file.");
> +		log_debug("Invalid or missing layout file at 0x%lx.\n", addr);
>  
>  	/* prepare DFU for device read/write */
>  	ret = stm32prog_dfu_init(data);
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
