Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBB7830DE
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Aug 2023 21:13:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28180C6C820;
	Mon, 21 Aug 2023 19:13:42 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13F95C6B455
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 19:13:40 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-d7260fae148so3826434276.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9l2lf+VGiR7RfTSgv2adKCh/z/cr473s3t2o62ozoE=;
 b=ACwzDPRf5jEknOTG+qHBDULl92hSOo8suobYVfNKrl7roJoEWHh1QvKPzR5y5EXZEw
 RwlN60Zu910BcaLR8FBtfbrAO8TjvyfqbR4yFZUYkk/OSYpAbvnZI5/RQTm94cWeptSM
 fg8T/C0K+0Cefg93vYP69xzvbMWXBAn+6UtRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645219; x=1693250019;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9l2lf+VGiR7RfTSgv2adKCh/z/cr473s3t2o62ozoE=;
 b=ewd+V+blgEuFis2dFNT6SRXSg1M2jHCrT4LTn1OBMbnzwOcfXshB/tW19ZyTgPLY08
 HDVbu9eSt6glpbAwBEo+n5C5izG8bI+90XCz7W5ErNL3PdU3EnIc3Fff8qjOhXTKdDS3
 cU58m/jve0vIfO7HaJkgoWJ+ggdAVdtEEjjcA9iuFqzXHnEcrpAKgvZzNqukkpZjycKu
 E7CsljX/4V9TOw4veybBYmC4p1pPO5dmnvUfy+rSk8hVpZf/18EX9zbP207n7r6Ag73C
 PfSCqBSyCcbS5cqKBPnXA9ncShP74JMdvpli+V+u72uQdO8yc75jR9Hof1vuoYi5bfVr
 /08A==
X-Gm-Message-State: AOJu0YxWdkU5z/fitx0VC8uT4jsf2VLdnyLuNKoliIRIyFHL+swKzsoO
 5bHyXCg8V46yZK0/M4GK/j7/I+7+sVq0zDJiI8Mbyw==
X-Google-Smtp-Source: AGHT+IEnF+jT1Z3/avsJt1ftzordFasavsoKtdgzgwGOO9+XwOXG2nhzmGg0hq4MzleXC1ghsRkRFbEBjefOMXUg/Kc=
X-Received: by 2002:a25:f81b:0:b0:d15:e204:a7be with SMTP id
 u27-20020a25f81b000000b00d15e204a7bemr7408289ybd.8.1692645218725; Mon, 21 Aug
 2023 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-7-alpernebiyasak@gmail.com>
In-Reply-To: <20230821135111.3558478-7-alpernebiyasak@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Aug 2023 13:11:51 -0600
Message-ID: <CAPnjgZ1e89kjsZLndKxh7U02GsfRzw+rhKJvza6LDiq+QahH+Q@mail.gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Alexander Graf <agraf@csgraf.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 06/13] vidconsole: Add damage
 notifications to all vidconsole drivers
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

On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>
> From: Alexander Graf <agraf@csgraf.de>
>
> Now that we have a damage tracking API, let's populate damage done by
> vidconsole drivers. We try to declare as little memory as damaged as
> possible.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
> [Alper: Rebase for met->baseline, fontdata->height/width, make rotated
>         console_putc_xy() damages pass tests, edit patch message]
> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---
>
> Changes in v5:
> - Use met->baseline instead of priv->baseline
> - Use fontdata->height/width instead of VIDEO_FONT_HEIGHT/WIDTH
> - Update console_rotate.c video_damage() calls to pass video tests
> - Remove mention about not having minimal damage for console_rotate.c
>
> Changes in v2:
> - Fix ranges in truetype target
> - Limit rotate to necessary damage
>
>  drivers/video/console_normal.c   | 18 +++++++++++
>  drivers/video/console_rotate.c   | 54 ++++++++++++++++++++++++++++++++
>  drivers/video/console_truetype.c | 21 +++++++++++++
>  drivers/video/video-uclass.c     |  1 +
>  4 files changed, 94 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

Suggest dropping the change to the final file
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
