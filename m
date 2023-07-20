Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A599C75B839
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jul 2023 21:43:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C91C6B452;
	Thu, 20 Jul 2023 19:43:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8E10C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 19:43:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so4840758a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689882186; x=1690486986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7mpyqKwSFYbBfWJNrPp/GOY5aI10cBe5LKAvKyGZ5Xo=;
 b=GAHsvxNYZzxt2Kazq3grz1cy+JE0P6riKbwaGxluhbQ1Q5HSPTtOuJa1muDX4776XP
 B8ZjMvJ4WJFPm2qQHZixmzE/rxVPzmf5RdmaoUYmCAMZr2RPmUE/Uvm3wXEK+Z1TpNxN
 qOYdUOS3bEurtfnPhUGoIlFQ6hSjrbTMrw4SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689882186; x=1690486986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7mpyqKwSFYbBfWJNrPp/GOY5aI10cBe5LKAvKyGZ5Xo=;
 b=DtNHtAnb0yxfpjNqH4iuombYjVpSH7sY/L2/T23kv1WyIl1yWbF4oiZl7rEmj0qP3Q
 MIlji+zPkLm7vh6TKudxfRFfJbsd3bFCGf5+4B0+nM+cqI2tjYFf07LpSxA/YXbT9+ai
 ic1skbv5nrAaScqlS5cq82ObSEK8vAg1o9kklqIUX2A4XktSsNbkbumFFo+oNAOTAFUZ
 11basavvZ5bgzxYyOkfGVOpMkWV73LZuRk5IbjeztEBIBUG3iUw7JXqSJuzxBJlLK4Nt
 NX6zGvutY56Z4pEtpR2SZp9GOwcg6r1rFbGiXEyrXQTsxqnHVxqwmNTIiQz85V4/jkZB
 apwg==
X-Gm-Message-State: ABy/qLY5GW2K2ERw+HaGgWYOPgREW+XZw9XFvUUYpAL1LFhjE75+xQ1V
 rvu10xepD6Hz75IF2jHRCPNgp3QuCCdvpxEHV3dzhw==
X-Google-Smtp-Source: APBJJlGd0PfTXu1vheiHHr8w+UpatqqPLu3fl/SEuyQT9pnrJIfT5/Khc5MfR2/fXdMN0hFE6BpMRy+fErFEAD6zYZo=
X-Received: by 2002:a05:6402:896:b0:521:d368:1628 with SMTP id
 e22-20020a056402089600b00521d3681628mr3700693edy.16.1689882186387; Thu, 20
 Jul 2023 12:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
In-Reply-To: <20230720123744.26854-4-clamor95@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Jul 2023 13:42:53 -0600
Message-ID: <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] power: regulator-uclass: perform
 regulator setup inside uclass
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

Hi Svyatoslav,

On Thu, 20 Jul 2023 at 06:38, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> Regulators initial setup was previously dependent on board call.
> To move from this behaviour were introduced two steps. First is
> that all individual regulators will be probed just after binding

We must not probe devices automatically when bound. The i2c interface
may not be available, etc. Do a probe afterwards.

Perhaps I am misunderstanding this, iwc please reword this commit message.

> which ensures that regulator pdata is filled and second is setting
> up regulator in post probe which enseres that correct regulator
> state according to pdata is reached.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/power/regulator/regulator-uclass.c | 212 ++++++---------------
>  include/power/regulator.h                  | 119 ------------
>  2 files changed, 62 insertions(+), 269 deletions(-)

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
