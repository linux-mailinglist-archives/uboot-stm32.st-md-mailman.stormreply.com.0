Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11278A96F
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 11:57:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5100C6A61D;
	Mon, 28 Aug 2023 09:57:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C24BAC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 09:57:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S8f3r5025220; Mon, 28 Aug 2023 11:57:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=TBwtltcI6zIi/92B7LylD0YVH9ucAeC6nOiXTdXML8c=; b=jB
 p22s5sBKpmc+VCXyJurZHKNFOntSNTZ0NOHGqAs+vt0Q7Gi8zCQlru3pzGMhWEKc
 uhj6pr77T5ghoLYmdtFoAEe0h+yLKRz8V1eBBxY0/5ftRNiMjG0DTPMLzvr2nmLz
 JlTEXk3kVCYqHudqq0RsdNC1is0hxxF6++8F3CEdO2M8U13TXtNRI4tkx7KS6ior
 uLp7xcK40mDsj+7JKdd+3Wp05Te2gkId7gaDmubqDm6EOuWNlz+AKuOedS04DaM5
 iauQ3P09FiNsaOB+gymyrB2ZXLrIPYv0FuZHVHpyGxbI1Ylz6nIF6NFFV9z72Bmh
 0zUonBfZ/nEEWd+GoxOA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sq6tff24d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 11:57:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1381E100056;
 Mon, 28 Aug 2023 11:57:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0785521ADD9;
 Mon, 28 Aug 2023 11:57:20 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 28 Aug
 2023 11:57:19 +0200
Message-ID: <43e626bf-f226-c0a5-e6d9-126c71bf162b@foss.st.com>
Date: Mon, 28 Aug 2023 11:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20230714152444.24395-1-ivprusov@sberdevices.ru>
 <20230714152444.24395-8-ivprusov@sberdevices.ru>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230714152444.24395-8-ivprusov@sberdevices.ru>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_07,2023-08-25_01,2023-05-22_02
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v3 7/7] cmd: clk: Make soc_clk_dump static
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



On 7/14/23 17:24, Igor Prusov wrote:
> After introducing dump to clk_ops there is no need to override or expose
> this symbol anymore.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>  cmd/clk.c     | 4 ++--
>  include/clk.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index 55fb96e631..59155d7902 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -59,7 +59,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>  	}
>  }
>  
> -int __weak soc_clk_dump(void)
> +static int soc_clk_dump(void)
>  {
>  	struct udevice *dev;
>  	const struct clk_ops *ops;
> @@ -81,7 +81,7 @@ int __weak soc_clk_dump(void)
>  	return 0;
>  }
>  #else
> -int __weak soc_clk_dump(void)
> +static int soc_clk_dump(void)
>  {
>  	puts("Not implemented\n");
>  	return 1;
> diff --git a/include/clk.h b/include/clk.h
> index d91285235f..bf0d9c9d7f 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -674,8 +674,6 @@ static inline bool clk_valid(struct clk *clk)
>  	return clk && !!clk->dev;
>  }
>  
> -int soc_clk_dump(void);
> -
>  #endif
>  
>  #define clk_prepare_enable(clk) clk_enable(clk)
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
