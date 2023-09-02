Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F88790468
	for <lists+uboot-stm32@lfdr.de>; Sat,  2 Sep 2023 02:09:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62DDBC6A61D;
	Sat,  2 Sep 2023 00:09:36 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B67EBC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 00:09:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5008d16cc36so4455422e87.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Sep 2023 17:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693613375; x=1694218175;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8W7gJ9i2zqTg0vCmIIcYq8wluPRSShl6DlKnvve2fT0=;
 b=RE1eHnTVSqYXYZvulrqY0/jjtDApWiaEAdut9KGA0mhVPbzJTxBhEdCMK9HUrt9t8N
 GUtnR467KBOpT9vNV/A+DOSUkF7lhcUJ/123K/z2JaxRSdtFlRdaUhXN94TriRjPiNje
 fs5GY1dfXxFDR9FuLfblwR2ORfCXrXmv5SaIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693613375; x=1694218175;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8W7gJ9i2zqTg0vCmIIcYq8wluPRSShl6DlKnvve2fT0=;
 b=QjNBNqZhzP9rh0Y55noJJieJaF5shQjyYCq0UR0J5wCy9K8RvjGEPbT+0gHse7NoZN
 EnQh/9s+eGpMSol3y5nIO7TMqHFdA19CUT0vDSA3BKpwnMyCMjnYrXj1CZunwar6M9Z3
 PlpDSpCh0MpMy12Qaa0UptBm9tyZ2C8+keyVRprhWzIo+dkLywIT/aRmbxB78NKqGYmO
 XZVgQoxGXPr2mP818dCUnJKpycGw6jLzBcr3Exan919o8z/utqmHbHVsYzuQp1qB4d68
 N3Y1WJMRK0Baxy18KS4u0ci0wqmdo29ScW5IOSA0Hgag8tPRkf1qtD3goFr4tx1l22yN
 inWw==
X-Gm-Message-State: AOJu0YxFF4HjkvpMjeCwU2974xNEMqFktJxaZBo0XIkqivCz/C/6ri1U
 IfzCUVHNMbPqtaHfwqnJSF9QgzqAtpjSV4ChEza+mQ==
X-Google-Smtp-Source: AGHT+IGZslH6xfZ1dELuWc5JyB0qXhfX3kepwSnPvHj9+3LOUyB0X/vYNER1pTBNK/1ZbiCDnOQnHgg2Icsk+BOPfeM=
X-Received: by 2002:a05:6512:3a86:b0:4fe:2c6:1d76 with SMTP id
 q6-20020a0565123a8600b004fe02c61d76mr3146575lfu.21.1693613374543; Fri, 01 Sep
 2023 17:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
 <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
 <20230824142505.GM3953269@bill-the-cat>
 <4cbffed6-6a07-1a56-bf10-7303e2aff78b@denx.de>
 <20230824151419.GU3953269@bill-the-cat>
 <8091c4f9-a0ce-aa69-098f-2effdb68ffdb@foss.st.com>
In-Reply-To: <8091c4f9-a0ce-aa69-098f-2effdb68ffdb@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 1 Sep 2023 18:09:22 -0600
Message-ID: <CAPnjgZ14AcYs4-kSRTBGfV=68SNHd3t6mN3qt79cteRyPoskMQ@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] stm32mp15: Use u-boot-spl-stm32.bin
	instead of u-boot-spl.stm32
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

Hi,

On Tue, 29 Aug 2023 at 10:29, Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Simon,
>
> On 8/24/23 17:14, Tom Rini wrote:
> > On Thu, Aug 24, 2023 at 05:09:07PM +0200, Marek Vasut wrote:
> >> On 8/24/23 16:25, Tom Rini wrote:
> >>> On Thu, Aug 24, 2023 at 05:12:45AM +0200, Marek Vasut wrote:
> >>>> On 8/24/23 05:02, Simon Glass wrote:
> >>>>> A '.stm32' extension is not allowed anymore, so change it.
> >>>> Why?
> >>>>
> >>>> This will likely break a huge amount of scripts, I'm tempted to NAK it
> >>>> unless there is a very good reason.
> >>> This is in the cover letter.  Today, buildman --keep-outputs doesn't
> >>> actually keep the needed for booting outputs from a build for a number
> >>> of platforms.  Simon's response is to stop having a free-form list of
> >>> outputs. With I guess the caveat being ROM-defined names (for example,
> >>> we still keep "MLO" because that is the literal filename TI ROM looks
> >>> for on FAT partitions, on mos of their 32bit platforms).
> >> Why not just place the free-form files into some output/ directory and be
> >> done with it ? Then they can have whatever extension they want, as long as
> >> the output/ directory name is stable.
> > Yes, an alternative here is to just extend the list that's removed in
> > patch 2/6.
> >
>
> The ".stm32" was choosen on output on mkimage to be aligned with:
>
> - all STMicroelectonics documentation  (for example
> https://wiki.st.com/stm32mpu/wiki/STM32_header_for_binary_files)
>
> - the proposed scripts or files, in particular in the YOCTO generated
> flashlayout files.
>
> - this extension list expected by our tools: STM CubeProgrammer
> (https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer)
>
> and Signing tools (https://wiki.st.com/stm32mpu/wiki/Signing_tool)
>
>
> So I prefer to kept the ".stm32" extension here:
>
>         filename = "u-boot-spl.stm32"
>
>
> NB: the justification for buildman '-k' option seens not fully relevant here
>
>         because in patch 2/6 you kept not only the ALLOWED extension but
> also some particular files
>
> +                to_copy = ['u-boot*', '*.map', 'MLO', 'SPL',
> +                           'include/autoconf.mk', 'spl/u-boot-spl*']
> +                to_copy += [f'*{ext}' for ext in ALLOWED_EXTS]
>
>
> so all the files "u-boot*" are kept with buildman -k even if it is not a
> allowed extension.
>
>
> I propose to change the patch 1/6 if you are agree
>
> and allow binman to generate the file with same rules than buildman -k
> option in patch 2/6
>
>
> The filename is valid if
>
> - the file is named with the allowed prefix 'u-boot' => 'u-boot*' so
> "u-boot-spl.stm32" is allowed
>
> - the file is with allowed extension =>.bin, .rom, .itb, .img

Yes OK, it seems this won't affect you in any case.

But as Tom says, we are going to try another path...basically just opt
in those files we need.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
