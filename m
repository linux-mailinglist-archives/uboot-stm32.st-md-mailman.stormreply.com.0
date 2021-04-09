Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E323599C3
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:47:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39983C5719D;
	Fri,  9 Apr 2021 09:47:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B31C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:47:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399fePo026196; Fri, 9 Apr 2021 11:47:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nhcXCtTbrX5RSqCdK8ITV+Cxbq/AG+REjWhE1/9aaYs=;
 b=3CoTWtJ++H5o/RZrTlMq3iLbFRy7sAPytcCgJi/FkwGArjC57fBwdW7jdG7DKgAGgaFk
 qR2tlK43tVbmVUwgUhdHPI8de2bKOlxk/jceOh3GQhoLS2LUbFb/gm2Sp6y/osyvlRNt
 Ne89BLMm4I/P3IGbI/hOfSlLOyjacAixtUmeA0xxH1I4Jp/McTm0AUHcDgn2Rdfl+KB/
 yaCnqzS6eQHl4bV2K7Xeth9nsTUWw6Tu/a2i463Dfm9lYceSurSbIB07/iK180sGWrkS
 eDhZRG+gWJaqEJrf9n/zQvz+6eoyAtaJz9tvrHoGtLtvscG5v1UE4SMaNMIbBiEJ/j2M Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5yypr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:47:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A90DF10002A;
 Fri,  9 Apr 2021 11:47:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92475228450;
 Fri,  9 Apr 2021 11:47:46 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:47:45 +0200
To: <dillon.minfei@gmail.com>, <kever.yang@rock-chips.com>,
 <andre.przywara@arm.com>, <priyanka.jain@nxp.com>,
 <jagan@amarulasolutions.com>, <narmstrong@baylibre.com>,
 <marex@denx.de>, <aford173@gmail.com>, <ioana.ciornei@nxp.com>,
 <josip.kelecic@sartura.hr>, <festevam@gmail.com>, <hs@denx.de>,
 <heiko.stuebner@theobroma-systems.com>, <u-boot@lists.denx.de>,
 <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <sjg@chromium.org>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
 <1617953326-3110-7-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e94022e5-5a2a-e544-f942-dd7c9968f9a0@foss.st.com>
Date: Fri, 9 Apr 2021 11:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617953326-3110-7-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v5 6/7] ram: stm32: fix strsep failed on
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

On 4/9/21 9:28 AM, dillon.minfei@gmail.com wrote:
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
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> v5: no changes
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

Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
