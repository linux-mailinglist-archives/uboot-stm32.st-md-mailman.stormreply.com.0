Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 806085F7A45
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Oct 2022 17:09:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78F2C0D2C0;
	Fri,  7 Oct 2022 15:09:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0015AC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Oct 2022 12:33:36 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d24so4426257pls.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Oct 2022 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQftRyuMpKFOKDNvU+uSXwYrc+C0Pz3tpb7gZfSAd4o=;
 b=fGzQHGQrMlwZLP362NInA7dL7zm/f+TaVf7DaCpOSzixTCAxiZ7xImyi9DVDm/QlAu
 E+U77yJCuxB2TgDRrvbFJy16tN67O14jIUmLvfWk+toInPCKDDoKcP4GGxoGafGT/uqu
 nOwrG7C0SvFECyNxhvdIzb5cYSuS7LVxNnRBkVciXQp0qu0BKoTyNl+Wf8h8UQotpqEO
 0/AM5Zn9eNOLfBuqfbRBgkV7DnKIhE06Em8c8nMvH8BOfFPjiQ8QkfF4O2wmiULkNEbt
 /BrOu8jYQfzWGlx+2DUBJH+bLfSQATUdRWvLJZ1pKv3zZbfC1axapFqs8/ajlc8t+atw
 u46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQftRyuMpKFOKDNvU+uSXwYrc+C0Pz3tpb7gZfSAd4o=;
 b=dH8DwX0bHNNsro0MbZHaH23hCiJ618j26dQ+YHsH6v7CKHUrjSM//nnRvKq5P4cp1r
 VOJgaLV+zweU7g/OTxV6q5pxlA58PDw10X64eVWn5/SzYyaPPWaGMNJPSy6KSHXEHXud
 asgr4PD3VvmjWAPVgEkSdSWg54avrrW+aosxK3FxLekw8PUZ5AOcl6dWUTpk5Je9f2pg
 EHBBqGMsDLMEv6YNG7G+CNhbEH8cvevm0wBLEexl0kY9uNK9bCGS/Kx5E6E2/lqSpNME
 j6utEKdbjUfj0jDZog1NmiszeK1tVfQnw9ughiDnG0w6bKbQQ82WGy50cFgZKTxlFseV
 qzRw==
X-Gm-Message-State: ACrzQf3u9t/9i9nufcnQqwZlMTX8ripSfUMJdGDGEMZ77YvGke+RvtiO
 GZ/c0lEtQIit6b2OXOXzG8w=
X-Google-Smtp-Source: AMsMyM5wMYDAiQDdI2+Mu2LGbyRGNPO5NGTG4anR6gJ6tFBTbpMM8VFPpuCwrHn3plpGqqpa/2OgWw==
X-Received: by 2002:a17:902:b194:b0:17a:ccae:4ceb with SMTP id
 s20-20020a170902b19400b0017accae4cebmr5035094plr.36.1665146015721; 
 Fri, 07 Oct 2022 05:33:35 -0700 (PDT)
Received: from [192.168.0.19] ([183.99.112.216])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a633d0f000000b0044a4025cea1sm1538373pga.90.2022.10.07.05.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 05:33:35 -0700 (PDT)
Message-ID: <c7bb6477-856c-32d8-1f1c-acc9b3f70c5f@gmail.com>
Date: Fri, 7 Oct 2022 21:33:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
 <20220913112346.301480-2-yann.gautier@foss.st.com>
From: Jaehoon Chung <jh80.chung@gmail.com>
In-Reply-To: <20220913112346.301480-2-yann.gautier@foss.st.com>
X-Mailman-Approved-At: Fri, 07 Oct 2022 15:09:27 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] mmc: stm32_sdmmc2: protect against
	unsupported modes
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



On 9/13/22 20:23, Yann Gautier wrote:
> The UHS modes for SD, HS200 and HS400 modes for eMMC are not supported
> by the stm32_sdmmc2 driver.
> Make it clear by removing the corresponding caps after parsing the DT.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 3cfa5a66f1..e1240b0cf3 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -675,6 +675,8 @@ static int stm32_sdmmc2_of_to_plat(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> +	cfg->host_caps &= ~(UHS_CAPS | MMC_MODE_HS200 | MMC_MODE_HS400 | MMC_MODE_HS400_ES);
> +
>  	ret = clk_get_by_index(dev, 0, &plat->clk);
>  	if (ret)
>  		return ret;
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
