Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B73587C90
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 14:42:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F39C640F5;
	Tue,  2 Aug 2022 12:42:04 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CBAEC03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 12:42:03 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id 125so14384893vsx.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Aug 2022 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ULSjuANCA+w5FBe11QsBWGh4L+q4cGQp9W+5CGCjeI=;
 b=guhrA2MCByFhAhcOywRMar3CL3Lf6yuRtiEwNoj7osWBjLNfJ1HQOVHbhL72nEXN6I
 o/t4rGbbnRMn19MtdfsKExvBhpSU4UOSTws7fgGfd5M0HdR5VuRhlhJD///lSSKlRruU
 Rvf/MRpWX9XHHWM899iClE+3uebnUxTLnSNzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ULSjuANCA+w5FBe11QsBWGh4L+q4cGQp9W+5CGCjeI=;
 b=zH2JjQsQgCP9IWdjYCaHtE0rNTbaVbOEDwldMxaPJipGSi4LzxTBecuUDfD3V6d1iV
 IJRjjC3lzIgQsk6jb5OK4uL8ay7W6QX1oWCm1rLroJJBExQc0jx7R0Emhih6U1GVj/S1
 5dIJ6WA5/2LghNnNCjEEkmDIZTCCS1DKYN0y49UMP4+xVAXU6P8a6VA69K8tn8DQoPUg
 iHodxkwdkVv+fsUuNw/EqLf3sWO38WlHgA/UtkNIQIjtVIZ4hVLFIoEyBpVgijVABGau
 XfDCruwPP5Fff3jYKDj/6Fw0hryJGrGinCjhbytiDddGxn/avJGCFn6cYO3tVnXmbPWr
 WDuA==
X-Gm-Message-State: AJIora939e5PRWH0B0vmyR78csd9lYhnKkQroG5qKoG44tWKnuhcbWzb
 PLiT9m/F5LKkOL6REBZ2Jg1Ap9GVngmtoICjZyretw==
X-Google-Smtp-Source: AGRyM1vrK4UQKjTvS6VhxLpxI6Cgxw4KrDZXc1QEXbflybl3ox8BhHdAt2PyWC0nHGO0C4JnsPowvQpWmTZApvx+1EM=
X-Received: by 2002:a67:dd96:0:b0:358:3dc0:fd8c with SMTP id
 i22-20020a67dd96000000b003583dc0fd8cmr7599460vsk.51.1659444121996; Tue, 02
 Aug 2022 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
 <20220802090910.277343-2-patrice.chotard@foss.st.com>
In-Reply-To: <20220802090910.277343-2-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Aug 2022 06:41:44 -0600
Message-ID: <CAPnjgZ0GGjA4RCB9dr8bLDSG=7RDCJTrXx7A93fjKdyhvo4+Lg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Eddie James <eajames@linux.ibm.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] gpio: Allow to print pin's label even
 for pin with GPIOF_FUNC function
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

On Tue, 2 Aug 2022 at 03:09, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
> without any other information. It would be interesting, if information is
> available, to indicate which pinmuxing's name is used.
>
> For example, for STM32 SoC's based platform, "gpio status" command
> output :
>
>    before
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func
>       GPIOZ5: func
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>
>    After
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func i2c4-0
>       GPIOZ5: func i2c4-0
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>  drivers/gpio/gpio-uclass.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Do you think you could create a basic test for the gpio command? See
test/dm/acpi.c for an example.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
