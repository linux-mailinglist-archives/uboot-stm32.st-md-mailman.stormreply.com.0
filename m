Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C79296B5F
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Oct 2020 10:45:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E93C3FAE0;
	Fri, 23 Oct 2020 08:45:52 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B855DC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 08:45:50 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id o26so1268162ejc.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Y7Qc1/6HPS1taMj7MQLQNNp+5zuRXb/cLMJvLCcfTk=;
 b=QC7+15eQt9BB8U/WkdbXzGIp4gbEKQsGiXPkUn3CVAPtQM/EGhT9fZbaf+qIRIWj5E
 xxxm2QTx6UR8M5uimqtWPjjuIfmx0q+YPtnE5LxenmWoOPO8iLCI5XxoSjwM2KjyGRoV
 PiAPKiebejnKHN5e9keDn6mNBIewGnbel1rvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Y7Qc1/6HPS1taMj7MQLQNNp+5zuRXb/cLMJvLCcfTk=;
 b=AD9aegHiB7j4cYvFwE1LMW322c0fO4BDVNZt1jHQq/NhD4bMKDY8kyowmpAcSWN1xH
 sUhRUSQAsAa6O158RByUfyYidPgAg3ipmtHPpZKzkA9Z2Ts5PzgvKL/n4xpDRAvXT3rv
 tzKXdTiCz3EeNeI4uQXlXYiOxvdU6PmYqJXyJE4p8X56dRgjRH6zM0z+lzlPjMGS69x1
 1I4Z33VkVIAsTwX99dHqjsTEz4zFhXXxdW0fUAkVfXkyCe3nKLiZv+L2EOvX0yLvhKlV
 fiFTnmomGZT1yrA+ovEo9fGCQwi0B28WWScxprqMtpXZm/UyfRS74Z10L57745Di/xn5
 9QcA==
X-Gm-Message-State: AOAM53078Q8+EM10tgv8W0yrSiC3lGyBjclZgBpwmdjwkrhPO6idU1aI
 rAegrviz1vBpmKTUYXy1aJuDI2M03Wop40SrwklfiA==
X-Google-Smtp-Source: ABdhPJxIAR24iC5VidtO9CsCrzLOCJccSJTgd6Qau/LztmcbIMdMZcAkozAa2CCCzrOOoOFYv5h5Xv9J8QKt/pDxB/o=
X-Received: by 2002:a17:907:a8d:: with SMTP id
 by13mr876369ejc.295.1603442749935; 
 Fri, 23 Oct 2020 01:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201015151817.29513-1-patrick.delaunay@st.com>
In-Reply-To: <20201015151817.29513-1-patrick.delaunay@st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 23 Oct 2020 14:15:38 +0530
Message-ID: <CAMty3ZA+K9mLW9zdQYTS82RTFvC-R9kizvU4Ch7e6wWgYP6kZA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot-Denx <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] spi: migrate trace to dev and log macro
	in spi uclass
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

On Thu, Oct 15, 2020 at 8:48 PM Patrick Delaunay
<patrick.delaunay@st.com> wrote:
>
> Define LOG_CATEGORY and change printf and pr_*
> to dev_ (when dev is available) or log_ macro.
>
> This patch adds the support of logging feature with log command
> (filtering, display of device name in trace) and allows to
> suppress traces via the syslog driver.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-spi/master
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
