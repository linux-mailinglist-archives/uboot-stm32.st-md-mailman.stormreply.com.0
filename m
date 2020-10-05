Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE082282EB1
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 03:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E407C32EA7;
	Mon,  5 Oct 2020 01:52:35 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB2A2C32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 01:52:33 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 60so7196437otw.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Oct 2020 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36uEkrOiUIP9VkIYEyVt1h3BmPwcsujt3fu0qhi6Hgk=;
 b=hM37TgS5fsgI0Vbzdb/SO3TBTKsODC6RJ+rbSlQAX3xoi1S1sKiMPZIHhquIc1vnNE
 7FDjh6tuCmGsRfUB7Im/ARp6mkhuvPu5boFkNteNRMHrVYdbiSG/czXKxrG53YUDtT4m
 0tay4ml9j/CVR29UlFJvfIZPLja6PwV7M+J+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36uEkrOiUIP9VkIYEyVt1h3BmPwcsujt3fu0qhi6Hgk=;
 b=Xy0Tuhqbr/EGxhiVa8tL+/qdpUJ8qmTPo3bpDQqs3y3XKk4Y2gz7ZQK5x720FGPRBa
 DN2MgV5DbWHmy6X8vx+VmiJLLk1U26t7x/7jJa3laBdeR6FjeCeGQJo63TbXvr6IqPei
 szCiX+wvxGAGBavzT9OQohv7hKP0BYQLobbNL5rgdrdk/oWv/ohfcH7NxY23JPqNDssn
 rLgFxPhcQAM2Qe5Fg/2lgtNa8aDXcNRvXvn0R55eGE0oelOf07Oxv03jzCJzoeoIVgVi
 2ZDZqxb5NRSYNd7c9xVMJk0oc6P48wdzzUlyhuMxX5do3BuRNL36QXV8cqLzcz8p7Spk
 ODNQ==
X-Gm-Message-State: AOAM5336MfLlWbPQFtNDLoVxhwxKzYkqoQ1TVJlxVhHdVrkwhOR5JZaY
 Y91bwQgLexrCdQh8qf9PylcnP7SQqDvvIlQGdlvvCA==
X-Google-Smtp-Source: ABdhPJzPAglcOsF6mbgFnGnyIZ2wXhCxMEMEZMpUAjXqxD+7DjbQVqPmUISGNRSbvB/p4Od3DmEwMsAavmJIFA2kO1o=
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr10037465otp.339.1601862752182; 
 Sun, 04 Oct 2020 18:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200928093017.19053-1-patrick.delaunay@st.com>
In-Reply-To: <20200928093017.19053-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 4 Oct 2020 19:52:19 -0600
Message-ID: <CAPnjgZ2VC4yX7u1UvkRqSM8UfpmYsLrLq1qExaTDLSjEK4qWxw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, Anatolij Gustschin <agust@denx.de>,
 Adam Ford <aford173@gmail.com>, Olaf Mandel <o.mandel@menlosystems.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] configs: migrate
	CONFIG_VIDEO_BMP_GZIP to defconfigs
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

On Mon, 28 Sep 2020 at 03:30, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Done with:
> ./tools/moveconfig.py VIDEO_BMP_GZIP
>
> The 3 suspicious migration because CMD_BMP and SPLASH_SCREEN
> are not activated in these defconfigs:
> - trats_defconfig
> - s5pc210_universal_defconfig
> - trats2_defconfig
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  README                                  | 6 ------
>  configs/m53menlo_defconfig              | 1 +
>  configs/mx23evk_defconfig               | 1 +
>  configs/mx28evk_auart_console_defconfig | 1 +
>  configs/mx28evk_defconfig               | 1 +
>  configs/mx28evk_nand_defconfig          | 1 +
>  configs/mx28evk_spi_defconfig           | 1 +
>  configs/mx6qsabrelite_defconfig         | 1 +
>  configs/nitrogen6dl2g_defconfig         | 1 +
>  configs/nitrogen6dl_defconfig           | 1 +
>  configs/nitrogen6q2g_defconfig          | 1 +
>  configs/nitrogen6q_defconfig            | 1 +
>  configs/nitrogen6s1g_defconfig          | 1 +
>  configs/nitrogen6s_defconfig            | 1 +
>  drivers/video/Kconfig                   | 8 ++++++++
>  include/configs/m53menlo.h              | 1 -
>  include/configs/mx23evk.h               | 1 -
>  include/configs/mx28evk.h               | 1 -
>  include/configs/nitrogen6x.h            | 1 -
>  include/configs/s5pc210_universal.h     | 1 -
>  include/configs/trats.h                 | 1 -
>  include/configs/trats2.h                | 1 -
>  scripts/config_whitelist.txt            | 1 -
>  23 files changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
