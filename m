Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8663660AAD
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:15:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7701C69066;
	Sat,  7 Jan 2023 00:15:00 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13F11C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:59 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 188so3500895ybi.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EAQcoOR82t3pwyNwvvAM7lFOeUMHsg8SJVGf5m5TpRQ=;
 b=TGgQXD4j61owrlYCR+O645TUts7ZV6HPIHer7YcsV6lrm+vGmF5GZfWwGgpoZdrpy9
 9QXEBS8cvhtR8oSg3PrqPdFn/amKkcYQtM3DpZVTdDOwu+4dwQnfk2M3uFLIaErBk+aG
 YEyJz0umGaDQbPfkZelJyLjzVPGWYCFy7wmk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAQcoOR82t3pwyNwvvAM7lFOeUMHsg8SJVGf5m5TpRQ=;
 b=kB2Psw8Z4Q9KcLY6JZHL+BJbX6UE/O57Wnmv/bV8dcWdrZ0iMCtzHtlVJvNqOJYnDF
 A7ZBQnAx9LYozvjPPcUrheDdSmx8Xw3kafZ6b6cFTTDTjKixc4YMW7DPZFUd6iMFLfZk
 ULswXIE+x1VH5kKqk2v9A07ZPySj+GBS9os/xMeswo2LGtpYqZR2MW6R8IeVLKdcBk8t
 m10M5xxXaAWl7JuA184+yFM+0grrYXs+W8EzVNotyaiLxMUVEfcKedY0vI//H5FaZSI5
 kHZn0W6O7Nyrjoo/765OEeLI1AICh+aIRmOwOVzGmKTyz3x5fbuNFCprBuVLnxjbKCVK
 T5xg==
X-Gm-Message-State: AFqh2kpcS6nwcsMZYgurNcmLiu0cT2Y6KrKoc5WRBN0DeiVD4otqLdv1
 I5fd7RPlfwCQZ3AZiCK5VqEd3I77jcS6rCtBvA8lIg==
X-Google-Smtp-Source: AMrXdXvAKf6Let8DFUtlDnsAfaeBR/OPvcZp4K0kqxh+k1ldXkPKRvVA5UQh93IBzKVDAa9/52Y5ZEkEJLaVIaha0wQ=
X-Received: by 2002:a25:1f07:0:b0:78e:81ec:c21d with SMTP id
 f7-20020a251f07000000b0078e81ecc21dmr2749564ybf.449.1673050497838; Fri, 06
 Jan 2023 16:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-9-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-9-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:39 -0700
Message-ID: <CAPnjgZ3xAuGooVVhvqsqe9hA_6CSo0sT_6h2+XGF-qnETC9PWA@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 8/9] video: Always compile cache
	flushing code
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

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> The dcache flushing code path was conditional on ARM && !DCACHE config
> options. However, dcaches exist on other platforms as well and may need
> clearing if their driver requires it.
>
> Simplify the compile logic and always enable the dcache flush logic in
> the video core. That way, drivers can always rely on it to call the arch
> specific callbacks.
>
> This will increase code size for non-ARM platforms with CONFIG_VIDEO=y
> slightly.
>
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  drivers/video/video-uclass.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
