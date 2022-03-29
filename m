Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C14EBB90
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Mar 2022 09:15:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6650C628A1;
	Wed, 30 Mar 2022 07:15:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F647C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 14:27:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TERAHE062580;
 Tue, 29 Mar 2022 09:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648564030;
 bh=RZZMi9VxMSkXp/Zmg51GTZO9FhWRFKSwfZbDGzFfcBI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Xk1Gp+9YVRYO9hfFL5+WNqYaRBxv9qAeqlEBMY2Fi4kKQ+TilpWUILwwauGQKM5XB
 Vy7NCGorM/m6cWVLfzT6HbxYymq4BVxsmqPOF5lsq1ZSmCiI7Q4cQwt7lvcVd5vRW6
 XnLbAmxMMLQwgGC+S0DgI/EaI3QNkpQkQH0hGvgw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TERAIt071533
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Mar 2022 09:27:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 09:27:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 09:27:10 -0500
Received: from [10.24.69.236] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TER7XP113412;
 Tue, 29 Mar 2022 09:27:08 -0500
Message-ID: <a5da4bab-a125-b452-8859-cec4fa058a1b@ti.com>
Date: Tue, 29 Mar 2022 19:57:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
From: Aswath Govindraju <a-govindraju@ti.com>
In-Reply-To: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:15:49 +0000
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
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

Hi Patrick,

On 29/03/22 19:31, Patrick Delaunay wrote:
> Provide human readable descriptions of the speed nodes instead of the name
> of constants from the code as it is already done for 'mmc rescan'
> command in commit 212f078496e4 ("doc: mmc rescan speed mode").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Aswath Govindraju <a-govindraju@ti.com>

Thanks,
Aswath

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
