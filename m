Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0F265ACC
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 09:49:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0371CC3FAE3
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Sep 2020 07:49:31 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2DD1C3FAE2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 07:49:27 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200911074924epoutp0273e276c0dabb095525652297651e0864~zqztkS36t0977609776epoutp02P
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 07:49:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200911074924epoutp0273e276c0dabb095525652297651e0864~zqztkS36t0977609776epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599810564;
 bh=+B+pbJ9cCffQ1EtRndTm+adptL2LvKlKNeyrYnDvay0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=lbWc8M0RHVbl2spNg7pr0E6+wnVobB2Lp/h0aam5cmB1PzA37+wIGL4GNYzTOg2AE
 NLBThwdYV2cJzqMLMFiqkDi+TAvzFq+SnTF55ERzM5X+7BpclTD7xQjk31n6BU/KoE
 uyfiEmQhCtIcY2oRIRlgygleTv5WB46pGbBdOhLI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200911074924epcas1p3a9147bbf3717295c04e09ad8e00303fb~zqztZgi2g1402714027epcas1p3N;
 Fri, 11 Sep 2020 07:49:24 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Bnnvj5QyyzMqYm5; Fri, 11 Sep
 2020 07:49:21 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.70.19033.10C2B5F5; Fri, 11 Sep 2020 16:49:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200911074921epcas1p285f7372d59256e0c88c04521e98b4b5d~zqzqq5uMD0098300983epcas1p2s;
 Fri, 11 Sep 2020 07:49:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200911074921epsmtrp2fb4257d4b73d8f1bdca6ba77c1dc80e2~zqzqpE4hw2594625946epsmtrp2o;
 Fri, 11 Sep 2020 07:49:21 +0000 (GMT)
X-AuditID: b6c32a36-159ff70000004a59-01-5f5b2c013903
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D6.F1.08382.00C2B5F5; Fri, 11 Sep 2020 16:49:20 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200911074920epsmtip17b4fe76972a6d9313f6c21c45aae36c4~zqzqba7Et1624716247epsmtip1C;
 Fri, 11 Sep 2020 07:49:20 +0000 (GMT)
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <79b3e835-0dac-43cd-9d6e-0d31e985424b@samsung.com>
Date: Fri, 11 Sep 2020 16:49:33 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909215402.366561-1-mr.nuke.me@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmgS6jTnS8wdNLqhaz7l9htZhz4iqj
 xcpL/1ktfqz6wmrxdm8nu8XCrctZHNg8ds66y+5x9s4ORo+N73YweRzcZ+jx9Mde5gDWqGyb
 jNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKALlBTKEnNK
 gUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFlgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGQ/+
 PWMvWMdT8WPRA9YGxq+cXYycHBICJhIXVs9g6mLk4hAS2MEo8fFIKwuE84lRomHTEmYI5xuj
 xIq1e9hgWt5caYJK7GWUeHWwjRHCec8ocbT5KxNIlbBAmMS6h91Aszg4RAQiJHZdEwOpYRbo
 ZZR48fYZO0gNm4COxPZvx5lAangF7CSer9UDCbMIqEpc2reFGcQWFYiU2Pn0JVg5r4CgxMmZ
 T1hAbE4Ba4mt5/eDHcQsIC5x68l8JghbXmL72zlgx0kIdHJIrOxbBHW1i0TDxFVMELawxKvj
 W9ghbCmJz+/2QtVUS+xqPgPV3MEocWtbE1SDscT+pZPBDmUW0JRYv0sfIqwosfP3XEaIxXwS
 7772sIKUSAjwSnS0CUGUqEhcev2SCWbV3Sf/WSFsD4lj97awTmBUnIXktVlI3pmF5J1ZCIsX
 MLKsYhRLLSjOTU8tNiwwQo7tTYzg1KlltoNx0tsPeocYmTgYDzFKcDArifAm5UfGC/GmJFZW
 pRblxxeV5qQWH2I0BQb2RGYp0eR8YPLOK4k3NDUyNja2MDE0MzU0VBLnfXhLIV5IID2xJDU7
 NbUgtQimj4mDU6qBSYDtyEsewSpD61N3uk7VzPz6csXR8oBsjjBRv5Z/oja/raK5d8y/e1e+
 uyz7qU74yY71yxJbosKF4qJs89hce8Knvbif1f5nmYQY097DW5dGP6i9YTmN02vF3AObOGP2
 rU2LZzx8xmH/m3lerTu5lgRFumnOsV0ne2fTK37NuzWcUw6e3qgQUXgyefaRgk8imptbT5yr
 umqcI/PjW+3bQzNmnj+k+/HgqdsJW/aLfhVs4Ak8c+O3xs8VuU9WKVcnv1jPlfvwQKllWF7J
 X2vBhE4F96vheS+zxUMfL54rNqnimOTt7/0pV64FJteUP7t1xX7lypu81iITb3N87UlKav18
 /wXDnYo5Mc1nn8r67VBiKc5INNRiLipOBAClkcdOJgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnC6DTnS8wY4VVhaz7l9htZhz4iqj
 xcpL/1ktfqz6wmrxdm8nu8XCrctZHNg8ds66y+5x9s4ORo+N73YweRzcZ+jx9Mde5gDWKC6b
 lNSczLLUIn27BK6MB/+esRes46n4segBawPjV84uRk4OCQETiTdXmpi7GLk4hAR2M0p07m9n
 g0hISXx+OhXI5gCyhSUOHy4GCQsJvGWUuNZXAWILC4RJrHvYzQJiiwhESPTs2MIIModZoJ9R
 4uXyd1BD+xglJl9rYAKpYhPQkdj+7TgTyFBeATuJ52v1QMIsAqoSl/ZtYQYJiwpESuzcYQkS
 5hUQlDg58wnYfE4Ba4mt5/eDncYsoC7xZ94lZghbXOLWk/lMELa8xPa3c5gnMArNQtI+C0nL
 LCQts5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERwpWpo7GLev+qB3iJGJ
 g/EQowQHs5IIb1J+ZLwQb0piZVVqUX58UWlOavEhRmkOFiVx3huFC+OEBNITS1KzU1MLUotg
 skwcnFINTOcyNv5QNXAsrLSaln2oeXKDGc/m2ntzag9z/q45mK34N/9BZl/uj/laz582/m0s
 fm1/7rzg9v1/bLnfv69dbPIkOXZp6c6nrfPuSC5//1BMLvKc8toT83wiGF/YLy9u0Oz1mqSj
 vPHZ3r7aS6oTxDbP31/sWdfrtlgj/Gn8Ws6YJzdeS/ZYX+KuTOI9ZfT67Y1gy6JrAfsTdorp
 8SXdnlXJI7ndoLnr8UylqoIHj5fVrElu1ZyVH7J41+qIVT1L/bLzdjXs854Vwz1Ns9e9f7uz
 QINk09qYwNw3nIlfY5f8k5/CHsDWrdVeYeNcO2vN3L7n4nf+XTnNUlXw5P3i1UX/fkhKhD3f
 4vkyXS1cXomlOCPRUIu5qDgRAGQzRFUDAwAA
X-CMS-MailID: 20200911074921epcas1p285f7372d59256e0c88c04521e98b4b5d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200910005435epcas1p20d2f97d097717214bd2836fafdd140d9
References: <CGME20200910005435epcas1p20d2f97d097717214bd2836fafdd140d9@epcas1p2.samsung.com>
 <20200909215402.366561-1-mr.nuke.me@gmail.com>
Cc: u-boot@lists.denx.de, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to
 read host capabilities
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

On 9/10/20 6:54 AM, Alexandru Gagniuc wrote:
> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of
> struct mmc_config from devicetree.
> The same logic is duplicated in stm32_sdmmc2_probe(). Use
> mmc_of_parse(), which is more generic.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 6d50356217..77871d5afc 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  			     GPIOD_IS_IN);
>  
>  	cfg->f_min = 400000;
> -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 | MMC_VDD_165_195;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  	cfg->name = "STM32 SD/MMC";
>  
>  	cfg->host_caps = 0;
> -	if (cfg->f_max > 25000000)
> -		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
> -
> -	switch (dev_read_u32_default(dev, "bus-width", 1)) {
> -	case 8:
> -		cfg->host_caps |= MMC_MODE_8BIT;
> -		/* fall through */
> -	case 4:
> -		cfg->host_caps |= MMC_MODE_4BIT;
> -		break;
> -	case 1:
> -		break;
> -	default:
> -		pr_err("invalid \"bus-width\" property, force to 1\n");
> -	}
> +	cfg->f_max = 52000000;

cfg->f_max can be also removed?

Best Regards,
Jaehoon Chung

> +	mmc_of_parse(dev, cfg);
>  
>  	upriv->mmc = &plat->mmc;
>  
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
