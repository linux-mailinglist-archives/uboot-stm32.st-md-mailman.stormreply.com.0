Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9149E56B
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jan 2022 16:06:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8196DC60465;
	Thu, 27 Jan 2022 15:06:03 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA55C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 15:06:01 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id z15so2008786vkp.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 07:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJpEi+knnlzY01BEJgn/MpqXzynYbE8M0dJHKmSTuNk=;
 b=SFWG1j/awY6V7E9poJ40vfCWIiOZQ3zSguNiZJLcPL9e+8sHISjR2lOr6L5ftdKuMa
 TCLTWXy0A70HiHPMbTSTA5bu7OgrmhmPgceOYVaZAACMX+GJvnsoSwdRrnahYljWuRXb
 HIZy0mUtMiWL4Fscv7B5n+rZI64dF5XyfLW/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJpEi+knnlzY01BEJgn/MpqXzynYbE8M0dJHKmSTuNk=;
 b=P0zHR8/Ylcc2+CvqcKDf0tJIlXRM7DlE0Nm4VNs53nL4acW5xci+VEeUIQDetNXtFO
 TwXEx3zbnHNb4JGd2yiSkHkfrC3CxS5U+gSXLlOMCPFzOdrq1uYqA/Qm4tdVUGiM/RcR
 cZOFJiVNZBzpBP9LbEu/P0MIz7OjYF0kZyqRvcI1z811OsqLGmd9mGctOX/5mkcibjD6
 skJUpk//cnOgaKq9HxiXVNHWLWVaEXNUkoXVXNZbpU9YpFhdSo8BELGcLtdUICLG+BSj
 sAfasjLYj1zf267hkHS0PYOtakrUELNMltNbWxjav39eBgtggOBfIt6cmRCDCd8nHIgV
 KSQg==
X-Gm-Message-State: AOAM531JYzVrMGhncHkjMauvMSzABOLB/exgLGvqUrTGSLJ1AjB3smGM
 D7CTSuqYmP7GMShbiTdLwyYWngNz+mlxvpDRtK41DQ==
X-Google-Smtp-Source: ABdhPJzTURsHlmOQ4PPBGvsbH7eBQtABqMfcXgoV78U6xWkxJEtnm1tCamtXPCmGs7urhNmqvBpg3hqeuhIvUSQ1AVY=
X-Received: by 2002:a05:6122:c98:: with SMTP id
 ba24mr1630227vkb.8.1643295959199; 
 Thu, 27 Jan 2022 07:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
 <20220117164919.v2.1.Id4243a671034f3f7b464dc2753bf03a33ccdd60c@changeid>
In-Reply-To: <20220117164919.v2.1.Id4243a671034f3f7b464dc2753bf03a33ccdd60c@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jan 2022 08:05:46 -0700
Message-ID: <CAPnjgZ2bJQk-j_TTPSnOb9SXNRZeP74VodcASXwqSY_1nzGamQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] dm: fix up documentation for
	uclass_get_by_name_len
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

On Mon, 17 Jan 2022 at 08:49, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Fix up the comment for uclass_get_by_name_len() to avoid confusion.
>
> Fixes: 4b030177b660 ("dm: core: Allow finding children / uclasses by partial name")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  include/dm/uclass.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
