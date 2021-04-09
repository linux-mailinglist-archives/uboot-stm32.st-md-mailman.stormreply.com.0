Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CA359C89
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 13:01:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A9CAC56639;
	Fri,  9 Apr 2021 11:01:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6944BC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 11:01:20 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q5so3979536pfh.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U3/P4ktehcxOvQTIt38bE8ipNU9dzLL/YrPomFbdaNQ=;
 b=ruGM5TW6iP3u8ukf3HcQwh8/FhNrv/9RUPygVRurO9EMR6P1PamfkBLkrMuW0giJoN
 vJ6JiVPpKPwSyI++jN2cBjhguXy/B/kOOTUeTxi3eqzrPV3kC+08wpPA/PF6Wya5DtBd
 wrT3d9rJ75FmP87qbqPGS+62q8r3i8oKDxXbRdLc1Ql9CL+JTVBFvuWNsEnSxobYEGs6
 fv5PZZ22JsmafLo7Jv1m2PUGy6295K6OC2BkFSMtadtRb/wByjpxdjmvVkZnY3rNIDRf
 aCdftACUex4FQ8vxbGCzOmOQ6JcapccVOxxRE6045CAVMYzx892Dk3WGmsBnFGQUtPk0
 NE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U3/P4ktehcxOvQTIt38bE8ipNU9dzLL/YrPomFbdaNQ=;
 b=fkd9+XrCU0QB0ZBUT5b5NjpqYpxGvnN3A1TgbVvGivTYIs3n0zUbiM67sNvudKoIUg
 2SdCGf4qi0le0Ltio64CIdVRrl0+kLyN70+f/evXRi6AzFbz20CfGilycrk5nhE9g0b9
 Qvr/3c+H6vjF8rbyl7Kivu1cT8qV6NZBeuAlH3P+P08hOIwM7BiHBbrYb2s50jMlPjLr
 LQ8XPs6m4T2kfX9jZBgimqqWk5e8v/5GFTp8oOiEjH/ciHFzLu3Rh2LtmJlfYm59W6j+
 TjGQz2DsuMTbNm0xJSXB5kSZhcrStD5FIDXRGFyGyFSVrGkC8zOXKHESmIIn5bHp+c65
 lNtw==
X-Gm-Message-State: AOAM530k83IGrZpDK5whHFB8PewUF3S5JNBhrDcX9o5+/tvTK5NC6/uI
 tRWfuYWMNLfNii1mtHMPRDGlz3hiCYCIQ1RLM3Y=
X-Google-Smtp-Source: ABdhPJwvQsSkH/FF7eH8+DsCgvAkgd79QbLOBrOJGnULNWUuG2Apvr7nxfodPgSKsgHsgAmPrm2xfmyJncQGAXmwDU8=
X-Received: by 2002:a63:c48:: with SMTP id 8mr12522697pgm.74.1617966078839;
 Fri, 09 Apr 2021 04:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
 <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
 <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
In-Reply-To: <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 9 Apr 2021 14:01:02 +0300
Message-ID: <CAHp75VeapNBfb=LbSdhyOt=CAd704khVAsc5wgFUs9-C9+dCuw@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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

On Fri, Apr 9, 2021 at 1:32 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
> On 4/9/21 11:48 AM, Andy Shevchenko wrote:
> > On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
> > <patrice.chotard@foss.st.com> wrote:
> >> On 4/9/21 11:16 AM, Andy Shevchenko wrote:
> >>> On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
> >>> <patrice.chotard@foss.st.com> wrote:

...

> >>>> +                       if (drv) {
> >>>> +                               if (drv == entry)
> >>>> +                                       break;
> >>>
> >>>> +                       } else {
> >>>> +                               if (!ret)
> >>>> +                                       break;
> >>>> +                       }
> >>>
> >>> This can be simplified to
> >>> } else if (!ret)
> >>>   break;
> >>
> >> I know but checkpatch.pl requested it ;-)
> >
> > You mean it doesn't recognize 'else if' construction? Then it's a bug
> > there for sure.
> >
>
> No, i mean checkpath.pl request to put {} on all statements as shown below :
>
> ./scripts/checkpatch.pl 0001-cmd-bind-Fix-driver-binding-on-a-device.patch
> CHECK: braces {} should be used on all arms of this statement
> #83: FILE: drivers/core/lists.c:228:
> +                       if (drv) {
> [...]
> +                       } else if (!ret)

So, you still can put else and if on one line, right?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
