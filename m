Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FA7E3CEA
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Nov 2023 13:23:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2092DC6B44B;
	Tue,  7 Nov 2023 12:23:21 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4906C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 12:23:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-53e3b8f906fso9364811a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Nov 2023 04:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699359799; x=1699964599;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dK80Glwohnq7XjDiihSkUXIccI4jX9qMvgljNOHnpaE=;
 b=SHzULQxzgjq2gG7rd+sTXL5qJTpVggaFnjd6/dSXwP0pO7WcGt0OuSXvOWXfGWldEK
 lJxTkUmTZw52R8vJ5fhG16SDRbskAggbmfqsf8RvawxuNhlbPcsGYpjHxe+tdTCeaie2
 KaFP/kW2nB/Wla/Oiz69Td5UKLrqVlfr9hOB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359799; x=1699964599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dK80Glwohnq7XjDiihSkUXIccI4jX9qMvgljNOHnpaE=;
 b=KI3G5uu9rehU0HB7e6vsgT8PKcvaigO8cA/RMxFvvBFDc1XptmrCOjVzj0isELQKaT
 b8USytG22SK7t7xXtnTevUGx9xHf8D6h48ek1EiyMUKoE+adn9q4MjayrEopRQ1lTCL1
 aIq9p/P5DmwFO3JXdubqypuQ2pTG2blduVi1O1D8g+SluqENgVW1D8rpxht0GqYwFoLp
 ayjZghXGe3W1NTzHlEHt0/Hb3VMDRdiA2QZGdn708DdrC3xhFdGShssyWY5BTsokKPmm
 CrIv8Jg3Odnh96fmt3vvoc/uxDqjENCyCB8Sl1ed+dD/zCnXar3jCVhFZKuBJ+T1wB0v
 9N2Q==
X-Gm-Message-State: AOJu0YwV+7/wImReNZz0rJnqMOm9NnL5eb2zGNy7lbGWoc/q/mqpowWN
 s8N2+cpLQoLjMLxfSr1W3BxP/D2TdASeses/LsPRKQ==
X-Google-Smtp-Source: AGHT+IF6ox/uDfMubPyairfdO25ziLh0RPGUGY5Ck6zsDcqvYf1KMlbdHNq90DlBx4Gr2pE5P+/mxK/5SF2I/AN4IoE=
X-Received: by 2002:aa7:d804:0:b0:514:9ab4:3524 with SMTP id
 v4-20020aa7d804000000b005149ab43524mr26873761edq.7.1699359798942; Tue, 07 Nov
 2023 04:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20231107101729.1.I843fdbc83d3f8522e4c43d47c72825b388643ac6@changeid>
In-Reply-To: <20231107101729.1.I843fdbc83d3f8522e4c43d47c72825b388643ac6@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 7 Nov 2023 05:23:06 -0700
Message-ID: <CAPnjgZ2YgwAzsG2kHZZWgy8p126hBH_r0r55nParwOt5wjuW+g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, deffo@gmx.de
Subject: Re: [Uboot-stm32] [PATCH] bootstage: Correct exhasuted typo
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

On Tue, 7 Nov 2023 at 02:18, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> From: Simon Glass <sjg@chromium.org>
>
> Correct this typo in the warning message shown when no more bootstage
> records can be added.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> I just cherry-pick the Simon's patch in the branch fix-bs-working
> of the dm custodian git but it is not yet present in patchwork.
>
> https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/8810b8dd3d233978c15203b23420fa819ab1e791

Reviewed-by: Simon Glass <sjg@chromium.org>

Thank you


>
> Regards
>
> Patrick
>
>  common/bootstage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/common/bootstage.c b/common/bootstage.c
> index a68d883c684c..0e6d80718fd5 100644
> --- a/common/bootstage.c
> +++ b/common/bootstage.c
> @@ -137,7 +137,7 @@ ulong bootstage_add_record(enum bootstage_id id, const char *name,
>                         rec->flags = flags;
>                         rec->id = id;
>                 } else {
> -                       log_warning("Bootstage space exhasuted\n");
> +                       log_warning("Bootstage space exhausted\n");
>                 }
>         }
>
> --
> 2.25.1
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
