Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD0359BF6
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 12:26:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40C19C5719D;
	Fri,  9 Apr 2021 10:26:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29E15C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:48:50 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t140so3472753pgb.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MD5nYTlpuGI/m1tUQXZXXw2y2EmMmzD+2qF11V0d0Fc=;
 b=V2xxv2Psb4/AdjgVpTWGxUjhSqzQOW0DyzbzLoPAb57qe1B2tEPqtiedQ+5q++zyKt
 oSLnbj8qdeY7cSDCbZI9sV1oQKMQ1kmL+urCsLCpTqIHnSMpGQ9P0/A4ayVFWH4gGsrk
 IibtbC/d1Gr/nxbVhC4O+N53e1HXDNgEFMHltXqu83zIgZ8wxn1hpL4lSkSO+MX2HOnx
 IOdKZafYMin4UpocqGvVfbcuN3ePLcR8r/dw+SX2hTAmfnJVpYUrR3Ukjsdsh44SGvKE
 E//DG7c7lIbRVQZF8v24XxgwTRryXaZG5kKtOeYa/t2XOwdGgsWwn2wrAdEYzamhXp14
 Kc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MD5nYTlpuGI/m1tUQXZXXw2y2EmMmzD+2qF11V0d0Fc=;
 b=Oog6q4vckIBo2tjg1dZEydpJNay0T8qw9Hj6ZCXE24LX337TWe4kwOUwVZ6T+JyOe2
 84wx2Hbjm2io22sGjRpl2SIniA4a/ETpAC2vu6HQ2v3Sj9UMHsiA4tCpjRKWFZyxYb2g
 ZAPYDDBb1ckxKbV46d/gUoRncvAWKQdiOz6TlyMgvBLWYkc3Oh+7U7EhS45yjB/h4mcF
 v2uKGfaRTxZ8FfrLd2FqruuSkdUJpmmytYXhAALaJwuWRLAfuvqKx9LkaPxh44mVTh+O
 QKW3JU+MemjGrwHtOZO2TfRg3ba76up0ggx0DZ4Dwpq+vUGNbZgThaBE2zc76d47qRYq
 4L6Q==
X-Gm-Message-State: AOAM530bN9iLBOy8kIVm8pGK8fD+kWzh1tZb6VEhjrV3wRpFAkaL0QZX
 TaJKVBdaIGnwfIm3byeFwZIyXCDJ8glFRquh7aQ=
X-Google-Smtp-Source: ABdhPJwH5KdM4KZ3t9mFyPBXq0Cz4DunR1k24LgYVQiczF9TpeATbPEkAvBbcjuatuT2Os6ULEFsNNXA2/KYIj+K9Io=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr11803120pff.73.1617961728582; Fri, 09
 Apr 2021 02:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
In-Reply-To: <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 9 Apr 2021 12:48:32 +0300
Message-ID: <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
X-Mailman-Approved-At: Fri, 09 Apr 2021 10:26:40 +0000
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

On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
> On 4/9/21 11:16 AM, Andy Shevchenko wrote:
> > On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
> > <patrice.chotard@foss.st.com> wrote:

...

> >> +                       if (drv) {
> >> +                               if (drv == entry)
> >> +                                       break;
> >
> >> +                       } else {
> >> +                               if (!ret)
> >> +                                       break;
> >> +                       }
> >
> > This can be simplified to
> > } else if (!ret)
> >   break;
>
> I know but checkpatch.pl requested it ;-)

You mean it doesn't recognize 'else if' construction? Then it's a bug
there for sure.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
