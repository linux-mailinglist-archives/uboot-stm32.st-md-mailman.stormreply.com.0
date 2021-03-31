Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ABB34FC35
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Mar 2021 11:09:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EAF8C5662E;
	Wed, 31 Mar 2021 09:09:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE2D5C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 09:09:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12V97HZY009100; Wed, 31 Mar 2021 11:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wbbCH9L8b7yCNox1s1r9SFgzc9EuwkrN8gQ1yxDNE3k=;
 b=Pekd9TgpIExdMUPIEVRWuPsVktsOUjX08O9nxhSy0FLxg5Z4pk4KYLW7Y3uEeUJsw2mq
 rElNG+1MKV28Hk5gay0vXtT6hMYqBwGp/43eg+FXSXmOeqiVgJoVv+GNr57Snyje5FT4
 ogYUe4N8xAwaZzaBA+MnnOdNvCrDVPbsJp8o8VDbonMYtigfoomflBtOmlXbpJr/u5tO
 Fhbw4jKbO9891+mhS/FPgrA+W1w7iTwls3wCdkmvwrGKFUGGIBaa8p9+rG1W7TYm8NdN
 Nnj61AHzlfKo4kBkJLbdYsHQDwIs1PwUgWtdhCN6D5igA5LCBnrNRCvETzg6xAIo964s +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37maamuhpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 11:09:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6998D100034;
 Wed, 31 Mar 2021 11:09:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C7032301D8;
 Wed, 31 Mar 2021 11:09:17 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 11:09:16 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
 <1616987091-3432-5-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <8858913b-8255-0461-4bb7-cc650054dc27@foss.st.com>
Date: Wed, 31 Mar 2021 11:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1616987091-3432-5-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-30,
 2021-03-31 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v3 4/6] ram: stm32: fix strsep failed on
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

one remark below

On 3/29/21 5:04 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> strsep will change data from original memory address,
> in case the memory is in non-sdram/sram place, will
> run into a bug(hang at SDRAM: )
> 
> just add a temporary array to store bank_name[] to fix this
> bug.
> 
> Fixes: f303aaf ("ram: stm32: add second SDRAM bank management")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v3: no changes
> 
>  drivers/ram/stm32_sdram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
> index 540ad85..da27677 100644
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
> +		strcpy(_bank_name, bank_name);

strcpy/strncpy usage is to be avoided. Instead use strlcpy()

Thanks

> +		bank_name = _bank_name;
>  		strsep(&bank_name, "@");
>  		if (!bank_name) {
>  			pr_err("missing sdram bank index");
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
