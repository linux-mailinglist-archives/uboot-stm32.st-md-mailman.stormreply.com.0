Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D02DECF5
	for <lists+uboot-stm32@lfdr.de>; Sat, 19 Dec 2020 04:35:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B887CC57180;
	Sat, 19 Dec 2020 03:35:06 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346AEC5717F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Dec 2020 03:35:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q18so5031584wrn.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZ9QS8/b1iXgm+vNM9oh0E1CxRs7loxxe1EtgNrO0e4=;
 b=LhByh7sGSKLs+j1FlwjHKom6qMYW8I37ISFWvNfTEtDsB+we3QY5Pv8jbKrvl3kSA9
 2ScXAvA6LPxyR/c7XeFMKeq6t3SxOF8RpGJotJ9fOkWplQvTu+w2T9HgZfyIMJOszbcf
 YnnJT75A+Xh4XnCd+Q461GWK97+6QPv/0JGcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZ9QS8/b1iXgm+vNM9oh0E1CxRs7loxxe1EtgNrO0e4=;
 b=DeGTgkp4XN9fgi+5LAw8MB5RhtxO4Y4bT6HaPLEXgRTT1B70BkRQISvWvoAQMsn94F
 4p8WVQwC4dsMJ9uFLPUw3warktX1T2MDBjmmQ5hMzS54hopKd1sJ6IGAJw8pDhc4lTIP
 k0fZ+2bcu5hdLe64JVX6T02oYssl0NKWJE+xn2xVrn8h4E/cVe2caCVVtoQrXdYgW1XW
 OHHKvoB5pdlPeRuBw/cE7ZWzbDBHwX+fiNaPbJDmOcnozaen5yT8g4Xw/GHv8/bFcq7d
 n/SubkzWIL5kMbc09+sTnpVznznpj57m+A0W9r2BrxdsGN+UIYFvJUb7VZkfbfdawKHR
 2+pg==
X-Gm-Message-State: AOAM533YnIIgAqqip4LzWUqaTQl1RPPqhqYX1WYnC7hKqjLT76S8FFeD
 Ym0itYG7XG1KDRpzCvVL1dtzSH6MhQ1T89h+WPjURw==
X-Google-Smtp-Source: ABdhPJze63L1mZLttrbwC6NXQ+4UUu1iTSaOCDB+Ru8QdWd2qSg137qcHVoyPE1smeo2hwCH79KxxPIBCthLo18T+so=
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr7370612wru.43.1608348905610; 
 Fri, 18 Dec 2020 19:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
In-Reply-To: <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 18 Dec 2020 20:34:54 -0700
Message-ID: <CAPnjgZ1dgdU2S3tT5PD7=92gBZG0e+LXwyDn-MJbNmGyKkFGNw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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

On Fri, 18 Dec 2020 at 04:46, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> From: Patrick Delaunay <patrick.delaunay@st.com>
>
> Add helper functions to access to gd->console_out and gd->console_in

I don't see those in this patch

> with membuff API and replace the #ifdef CONFIG_CONSOLE_RECORD test
> by if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) to respect the U-Boot
> coding rule.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - move the tests on gd->flags & GD_FLG_RECORD in helper functions
> - remove test on IS_ENABLED(CONFIG_CONSOLE_RECORD)
>   before to call helper functions
>
>  common/console.c | 95 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 22 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
