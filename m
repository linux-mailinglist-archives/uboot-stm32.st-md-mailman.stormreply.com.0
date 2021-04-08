Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD6358523
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:49:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC9FC56639;
	Thu,  8 Apr 2021 13:49:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5E28C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:49:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DlQ0X006587; Thu, 8 Apr 2021 15:49:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TYXooyzhX6bmNb270kNGzfoIMcMyv6Jsgi9sQdEibD8=;
 b=zuKBiksINPuOW+10bsFRS3SUibujqMWmG/9Ue2iTJ8TLssj9X+fCChUDMs8n3biomgAC
 t3+d16+Q2KgG+R1MzqvMlb39aEjqpYGYj1RINfjUWPWtpj2uWil8kCOy4dRpmvILhGtn
 EJvpjrdr1U3CEDagWEsCMAItYAHkCnKFPqc0tpMOEV55fRcANyYgqGDmeMwZMY5XT0yx
 QcerLL81YRnWXzDiTHQdh7woW/GO2+APZjM6cGQHHulROHV2UPi/+HybZrry+yqNuuHO
 iFjoQhvmkS0xaxOnuTBqL14W3XB+3dktDucOKnU6jh9MSCFpuOuePOV5AeFhF1CPPb71 QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37stwstxqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:49:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57D5B10002A;
 Thu,  8 Apr 2021 15:49:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 377B723AA8E;
 Thu,  8 Apr 2021 15:49:00 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:48:59 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
 <1617352961-20550-7-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1529e81a-dad9-83aa-165c-a54539677893@foss.st.com>
Date: Thu, 8 Apr 2021 15:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617352961-20550-7-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v4 6/7] ram: stm32: fix strsep failed on
	read only memory
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

Hi Dillon

On 4/2/21 10:42 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> strsep will change data from original memory address,
> in case the memory is in non-sdram/sram place, will
> run into a bug(hang at SDRAM: )
> 
> just add a temporary array to store bank_name[] to fix this
> bug.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
> v4: use strlcpy suggested by Patrice CHOTARD
> 
>  drivers/ram/stm32_sdram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
> index 540ad85..3e25cc7 100644
> --- a/drivers/ram/stm32_sdram.c
> +++ b/drivers/ram/stm32_sdram.c
> @@ -268,6 +268,7 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
>  	u32 swp_fmc;
>  	ofnode bank_node;
>  	char *bank_name;
> +	char _bank_name[128] = {0};
>  	u8 bank = 0;
>  	int ret;
>  
> @@ -300,6 +301,8 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
>  	dev_for_each_subnode(bank_node, dev) {
>  		/* extract the bank index from DT */
>  		bank_name = (char *)ofnode_get_name(bank_node);
> +		strlcpy(_bank_name, bank_name, sizeof(_bank_name));
> +		bank_name = (char *)_bank_name;
>  		strsep(&bank_name, "@");
>  		if (!bank_name) {
>  			pr_err("missing sdram bank index");
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
