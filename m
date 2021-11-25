Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AAD45D181
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Nov 2021 01:12:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 204F5C597BB;
	Thu, 25 Nov 2021 00:12:07 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B468C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 00:12:06 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id l24so8748448uak.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 16:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+opnpjtnGh1SPw/sS80fqOwaVqx9JGdwNTcs8JgadQ=;
 b=Q/s9/UZJIIJjdEZ2VaWjTiQGKvqqfiZVAKfdDFauk2h94k/5gJF1lhOU9HsZXh/eI3
 cpNhuRIgRBcOk8N6t1APcZgVFMcJynKiHs2G4EE4+tr+/mq51SKGVzgFtX/K5HwmJJJ+
 sKaDW9i1U9Y9u3PZHQ4uyhFI/IQ21j3E2KwoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+opnpjtnGh1SPw/sS80fqOwaVqx9JGdwNTcs8JgadQ=;
 b=ecfEl/p1HVjSBUnvD2XpGwsJ75T28IOOp0ELd5gGUY1m4U2tVe00soI+FrdNXgx94L
 CltaiEqFb9amsecvna3ijjqrlSByDWI7FUQaHmJRk+5Vy4rxFTuKAQVuZn9Qz+q6+uXs
 h8mq+Qvk/DYPJebN38yAvbClPZjg7v5i0LHUWKCmC7Cm4+sgGvjjvsuYUWzE94MvD8cO
 8s4c1GkV1bEwUfpF+d0T6xnRdAn7EAXiXswxCfQ590MHu2vufhvAptHdIBr899qI6UV8
 GlGycH50/DV3T0kt2wlwE3F+6y50tMLOACe54ePShSPUz5SkhL8vP6YIesARksQChg72
 1u+A==
X-Gm-Message-State: AOAM530KdAOapCC3NP9QciKQIrdpnfnpIfd9E1XjAtwKs+HsdMz0lX58
 yoTgJntZhAXI73MA3e5Laxx37XUkPsyY9jF/ywTbAw==
X-Google-Smtp-Source: ABdhPJxNt3M8wFCEryBgXDdmLQe6DFB70qc2UAVqyet6THbaOmYhFmhK/oXnuptRIYb9TM7moZJzVDR+kIFxWnhyUBc=
X-Received: by 2002:a67:e109:: with SMTP id d9mr2203604vsl.19.1637799124893;
 Wed, 24 Nov 2021 16:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
In-Reply-To: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 24 Nov 2021 17:11:53 -0700
Message-ID: <CAPnjgZ0j4RDfxv8wiybiMYBcTG6yvS4CPU-0C+FdFa6joNukrw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/2] scripts: remove CONFIG_IS_ENABLED and
 CONFIG_VAL in generated u_boot.cfg
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

On Mon, 8 Nov 2021 at 02:21, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> The two helpers macros CONFIG_IS_ENABLED and CONFIG_VAL are defined in
> include/linux/kconfig.h but they are not real configurations; they can
> be safely removed in the generated configuration file "u-boot.cfg".
>
> This patch simplifies the comparison of this U-Boot configuration file.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  scripts/Makefile.autoconf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
