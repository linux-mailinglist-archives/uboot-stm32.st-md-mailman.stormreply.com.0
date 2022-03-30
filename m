Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 720964EB760
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Mar 2022 02:14:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FD0DC5EC56;
	Wed, 30 Mar 2022 00:14:06 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB5FC5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 00:14:05 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220330001401epoutp04c7f4c3a8dfe070a8da9f0da4c623ae51~hAEaIMY9u0331103311epoutp04j
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 00:14:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220330001401epoutp04c7f4c3a8dfe070a8da9f0da4c623ae51~hAEaIMY9u0331103311epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648599241;
 bh=Vi4+2EoNo6zNCU+pVyCU6QwM1VIn2Wje5Y6ftme1pQI=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=X+mQSvZQpLqHI9OXK4A/jcGo+S8u0a6le2582iwXYFJiifJjZCH5MQC3GwCFUKIy5
 yU+Wuo02gUicAQgpIx4A8x4Kvx/k/TUPrWAQ7vJJzz88MEa2G0Klm9ErxIVZqHKd6v
 1suY6IenpUxAZXUL6i18U4juRD9s1wql0IiUrc9o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220330001401epcas1p1204888d23c0286d3ee73cf2575e83084~hAEZvWe1q0351003510epcas1p1h;
 Wed, 30 Mar 2022 00:14:01 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.145]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4KSn3S6yH6z4x9QX; Wed, 30 Mar
 2022 00:13:56 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 17.49.21932.BB0A3426; Wed, 30 Mar 2022 09:13:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220330001347epcas1p1af7ef24f9034f45761b3e6ce9c4427bb~hAENGYVN11034910349epcas1p1e;
 Wed, 30 Mar 2022 00:13:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220330001347epsmtrp2f7a1c689763609fe5097b4c8a80e87f2~hAENFlHdS2694026940epsmtrp2J;
 Wed, 30 Mar 2022 00:13:47 +0000 (GMT)
X-AuditID: b6c32a38-93fff700000255ac-db-6243a0bbbda5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DD.10.03370.BB0A3426; Wed, 30 Mar 2022 09:13:47 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220330001347epsmtip149a292d145a01d8d229f347921a4dc69~hAEMv9Et41046410464epsmtip1A;
 Wed, 30 Mar 2022 00:13:47 +0000 (GMT)
Message-ID: <15e158ce-91cb-a37f-7535-42fc2b235311@samsung.com>
Date: Wed, 30 Mar 2022 09:13:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
From: Jaehoon Chung <jh80.chung@samsung.com>
In-Reply-To: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmru7uBc5JBvMOWlnMe3KJ1WJqT7zF
 pPXX2C2m3l/LbPF2bye7xcKty1ksDk/9wOjA7vG0fyu7x85Zd9k9PnyM8zh7Zwejx8F9hh7H
 b2xnCmCLyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvM
 AbpESaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgWqBXnJhbXJqXrpeXWmJlaGBg
 ZApUmJCdsfP7XcaCN4IVM5YtZWlgfMDdxcjJISFgInHw9D9WEFtIYAejRNNupS5GLiD7E6PE
 wSmf2SCcz4wSf5tessB07Nu4hhUisYtR4tOKtYwQzntGicntt4BaODh4BewkblxXBmlgEVCV
 +N15FayZV0BQ4uTMJ2C2qECExK9bj9hBbGEBRYnT0yaA2cwC4hK3nsxnArFFBDwlbj7bDTaf
 WeAWo8SOtqOMIAk2AR2J7d+OgxVxCgRJLJx8lA2iWV5i+9s5zBCXTuWQWHGOA8J2kTh4/g4j
 hC0s8er4FnYIW0ri87u9YG9KCDQzSixdcpAVwulhlPjXcJ0NospYYv/SyUwgnzELaEqs36UP
 EVaU2Pl7LiPEYj6Jd197WEFKJAR4JTrahCBKVCQuvX7JBLPr7pP/rBC2h8S1n4+ZJjAqzkIK
 l1lI/p+F5J1ZCIsXMLKsYhRLLSjOTU8tNiwwgcd2cn7uJkZwKtWy2ME49+0HvUOMTByMhxgl
 OJiVRHhlz9onCfGmJFZWpRblxxeV5qQWH2I0BcbORGYp0eR8YDLPK4k3NLE0MDEzMjaxMDQz
 VBLn7Z16OlFIID2xJDU7NbUgtQimj4mDU6qBybqifQLH80cZH/9sKv3m5SWzYpc716Zf2/aa
 MnHN0lHI3Mj2P/mdkCRH5Rd5rhU1lf7ix2fNaHJ97pVhdlLjfvcj2576uNdT/P4lmcvNf52p
 ZP6Jh3f7nFLWvM2FUcvs24L/n3QJFnO3XmFdI2jLKPL77tm18iFnZSoUtnFPeBPOskf6ZwO7
 jYjtW444pRVVFX/9zJ63+3z1viQfUhu/TKBesSH3VLqZ2amZlvtmfj8aqi80d3HL9pnbj+iH
 vflv/VDZTEks5VD+kqjSSW88b7EzOy4OWC6flu9/+YHbtKDkKzc/tAc+/qBx49iBh7sfTL3D
 bt31uljNnSd/vSeHtEpGtGZF2Y6pCREMjGFKLMUZiYZazEXFiQA5Mkg+LgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnO7uBc5JBqvfSFvMe3KJ1WJqT7zF
 pPXX2C2m3l/LbPF2bye7xcKty1ksDk/9wOjA7vG0fyu7x85Zd9k9PnyM8zh7Zwejx8F9hh7H
 b2xnCmCL4rJJSc3JLEst0rdL4MrY+f0uY8EbwYoZy5ayNDA+4O5i5OSQEDCR2LdxDWsXIxeH
 kMAORolFky6xQySkJD4/ncrWxcgBZAtLHD5cDFHzllGivfs+M0icV8BO4sZ1ZZByFgFVid+d
 V1lAbF4BQYmTM5+A2aICERLLdk0Fs4UFFCVOT5sANp5ZQFzi1pP5TCC2iICnxM1nuxlB5jML
 3GKUmH5gCxvEsqWMEu9bv4NVsQnoSGz/dhzM5hQIklg4+SjYccwC6hLr5wlBDJWX2P52DvME
 RqFZSO6YhWTfLISOWUg6FjCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4cLa0d
 jHtWfdA7xMjEwXiIUYKDWUmEV/asfZIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNIT
 S1KzU1MLUotgskwcnFINTKkLEjUXPrsbcK7t3epJ2pUMFxZe8Jm5sOJF3KNj+pPNZh58c13v
 +iT2hGnSpxUSU1z+x1dN3rZj2hd+7cPHbWUP34xhcC5K7tRUeF0T+np9qWSlSPTi9jCrrjmW
 uz8fuXecl3uVZLFvq13lVK8D9lb7zbM2/duf3GD2au2iJX1p188pJh7NehaTYviuvYndZ8vk
 qIzrGl85ROK/exxf+FvosfbHKbpSHizLLNakSSw+m5f1VSUq1FvDTO/2r9M2P1Q6tv99MfWn
 1S+/PtdNDh+2WjC8vf52PZejwX/VUD7v9uIwZ/aFPbPqlzN9PpIRxRlj7u5x2aOtm2VH/r76
 5t1LHhfHzP/yZdXtltSTjUosxRmJhlrMRcWJAK+aVTcLAwAA
X-CMS-MailID: 20220330001347epcas1p1af7ef24f9034f45761b3e6ce9c4427bb
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220329140125epcas1p2b8a01db5c7295761d20cb51ebf85d0bb
References: <CGME20220329140125epcas1p2b8a01db5c7295761d20cb51ebf85d0bb@epcas1p2.samsung.com>
 <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
Cc: Aswath Govindraju <a-govindraju@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Reuben Dowle <reubendowle0@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] doc: mmc dev
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

On 3/29/22 23:01, Patrick Delaunay wrote:
> Provide human readable descriptions of the speed nodes instead of the name
> of constants from the code as it is already done for 'mmc rescan'
> command in commit 212f078496e4 ("doc: mmc rescan speed mode").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
>  doc/usage/mmc.rst | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/doc/usage/mmc.rst b/doc/usage/mmc.rst
> index 02b5d7b1c7..55e3f9cf98 100644
> --- a/doc/usage/mmc.rst
> +++ b/doc/usage/mmc.rst
> @@ -85,22 +85,26 @@ The 'mmc dev' command shows or set current mmc device.
>  
>     mode
>         speed mode to set.
> -       CONFIG_MMC_SPEED_MODE_SET should be enabled. The required speed mode is
> -       passed as the index from the following list.
> -
> -       0   - MMC_LEGACY
> -       1   - MMC_HS
> -       2   - SD_HS
> -       3   - MMC_HS_52
> -       4   - MMC_DDR_52
> -       5   - UHS_SDR12
> -       6   - UHS_SDR25
> -       7   - UHS_SDR50
> -       8   - UHS_DDR50
> -       9   - UHS_SDR104
> -       10  - MMC_HS_200
> -       11  - MMC_HS_400
> -       12  - MMC_HS_400_ES
> +       CONFIG_MMC_SPEED_MODE_SET should be enabled. The requested speed mode is
> +       passed as a decimal number according to the following table:
> +
> +       ========== ==========================
> +       Speed mode Description
> +       ========== ==========================
> +           0      MMC legacy
> +           1      MMC High Speed (26MHz)
> +           2      SD High Speed (50MHz)
> +           3      MMC High Speed (52MHz)
> +           4      MMC DDR52 (52MHz)
> +           5      UHS SDR12 (25MHz)
> +           6      UHS SDR25 (50MHz)
> +           7      UHS SDR50 (100MHz)
> +           8      UHS DDR50 (50MHz)
> +           9      UHS SDR104 (208MHz)
> +          10      HS200 (200MHz)
> +          11      HS400 (200MHz)
> +          12      HS400ES (200MHz)
> +       ========== ==========================
>  
>         A speed mode can be set only if it has already been enabled in the device tree
>  

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
