Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0B3DC70C
	for <lists+uboot-stm32@lfdr.de>; Sat, 31 Jul 2021 18:59:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BA9DC59783;
	Sat, 31 Jul 2021 16:59:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFB01C57B6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 16:59:51 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id m12so10865124wru.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwPXHzQNQss+LHCwuesp1PEXjP4jqzoKoKNyYUcWsPc=;
 b=EksC15ODOZPA3tf6b68sjzyJmtgXNXYsV4OqI7kzsEUKgRtdjnuUT/FuOP+G224mL2
 q15xYEhAyaej0kpUzH7XVNO6uB+BuDn3q20m+d++BbYiLIasp2JR0/1+j1GElfpte/vm
 a2HgBibB+TGczr6z1pySmc4q9ZbZUxasv/GwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwPXHzQNQss+LHCwuesp1PEXjP4jqzoKoKNyYUcWsPc=;
 b=ignSnlqar+SqpxlRseQzxXxZEWp2zOK/p2KtVKY5EtS9VgZtJnrSz9YG0T+sLnAk8S
 KXNdwztrnee5wxXx6UYo41UT6rqlYrPN1Jno2OqpINwbwyF9QsFnVI9V2jO2yIa/BMmh
 yJaw/AG4/9B2a5/UyEJgNBV5CsJRKH9jTGOXjQHGKct90GK4Su+1N475tPmhnRLf2/VP
 Z7XrOZ+vTIhVha0wVzh/+Jjzi7mTU5GIJj2UvHR3rnKNOtUBrMLqqH1zOojfBbVyJOCS
 T/UAxx3M/GASzPQ9G98NWkr/PrxIgyUGsjSjXh+ugNzRu1K+uJT258eVeyKP7nG91bU2
 QXTQ==
X-Gm-Message-State: AOAM531kW2K0mIkZLw4CqefvdXgM8T+CwpzIH11fJI8TiXt0gqp7k6L8
 WYQH0WBYo1yzc8F+q4rguAZihWkTFRhTLOmice49bw==
X-Google-Smtp-Source: ABdhPJw0zYPaeO7Dd91Gp8vgNrYQaFLhFTTPpKewnzRSVd49TEmIMltW2SY7ZBB4yA2MeBx58+fmcbefsw93BbK6uAE=
X-Received: by 2002:adf:ec50:: with SMTP id w16mr9065241wrn.56.1627750791014; 
 Sat, 31 Jul 2021 09:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
 <20210730121202.2.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
In-Reply-To: <20210730121202.2.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 31 Jul 2021 10:59:36 -0600
Message-ID: <CAPnjgZ1_DaoUmJH5Yh+ZfxnzvVaYYS10sHc8OqR41m1MDbD27A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] dm: add debug message when failed to
 select the default pinctrl
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

On Fri, 30 Jul 2021 at 04:12, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a message on probe in driver model core when the default
> pinctrl selection failed.
>
> This message is displayed only when the pinctrl API is
> implemented, i.e. when result is not ENOSYS.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/core/device.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
