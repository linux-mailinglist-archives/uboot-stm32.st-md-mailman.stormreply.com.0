Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBA8B2FED
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Apr 2024 07:55:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB768C71292;
	Fri, 26 Apr 2024 05:55:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D454C71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 05:55:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso204036966b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 22:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714110917; x=1714715717;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BQa8kaBJotkVzZyChUU4TXBn/qJxXS+6QrpaqtlFzRM=;
 b=D3M87tfGDTGxQtlp/1P5URxzxx9C8WrQdQahCnCxGzvdSnTcLhuRx3TyI+Gn05I+Ax
 6vQ7wRpjWecCmBLyaMR6ol/xvwJzs7Hu074kzBTM9JIhuZgoFa/GoX1cc2C3A3fcLtr5
 fAlF6vktJc3yKLN31BEzfoQd8/k2O/FAq2Va8HJIsktq7mq5iNvRsDCe4/KS4kQ5sGCN
 xjZ/kt87ID1cPLFilQdNn1TKWYFANbeotodILOgNwy/0Fn20hhzAaJgUI19zsgZaKDXC
 5HQgbU0/+jDlEZMpW/x5luG5JpwzwDhK/2BDupZjdb+FDjNjesJmMoit311f3YMDdXrK
 +EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714110917; x=1714715717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQa8kaBJotkVzZyChUU4TXBn/qJxXS+6QrpaqtlFzRM=;
 b=WdZN55HU6m6+IqsTeMnMgrR1MXbuXjh3hvTshk/hikrbHkuExviPme4EM8phRyhsND
 8CqBu3V9DrOA5voHy79FeKCOc61I+vMKnNwMvmcqw0kotpwpYs2qlGrs8Sz1zbc7t7rr
 ssBYjiD04D3Yf3bWm3HiqSHuqfARo9eH/ixJbapldkoRx6UaFdoz83dH4gimaoHJPyGr
 Bl1APdoi9es4UF88mZgY8a/xFd2YDQxaV/8V7mH/TiaGQluzG00ySAKRHv1i1XFGCAuV
 AN3Jw+IO8ekVsqxQJ76Y6OZepaTxzN770UT3JOkMuqbbvne9aRJJh/iZg0lLduS3yOE3
 WPLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMuH83GRBtt/vD+BrXMm06UrMcv0Y0WygX68IQxtO4Nk5kxWvs5kA6tdfCHpK5aA+v+YAA0eQQ8SOl1oFAs6z+7wIFxxByGZbdrxn9s3/h/CNmfVSUpAd+
X-Gm-Message-State: AOJu0Yx/5022D8/KX9VRaDJ5vn+nmoAo61no2NobPfTcJDMdjbnEyKvC
 GMrlp8/s+8puAuscOWAl8TUcxkMwjFlEpxxGx6st/EnQEW2aPfReXQYkhxH/0uo=
X-Google-Smtp-Source: AGHT+IFbOEOgp0QeCgtRd4lXgbo8XMiH0OjZ2YQKZ1GetMZlY0sXtKIsf+VSHfgl4qJiINVlxdzkzQ==
X-Received: by 2002:a17:906:249b:b0:a52:33b0:fcb1 with SMTP id
 e27-20020a170906249b00b00a5233b0fcb1mr1113401ejb.32.1714110916437; 
 Thu, 25 Apr 2024 22:55:16 -0700 (PDT)
Received: from hera (ppp089210108048.access.hol.gr. [89.210.108.48])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a170906355800b00a524e3f2f9esm10257554eja.98.2024.04.25.22.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 22:55:15 -0700 (PDT)
Date: Fri, 26 Apr 2024 08:55:02 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Message-ID: <ZitBtjJhScekRlm0@hera>
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
 <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
 <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Richard Hughes <hughsient@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 FUKAUMI Naoki <naoki@radxa.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 chris.obbard@collabora.com, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Uboot-stm32] Capsule GUIDs and LVFS
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

On Thu, Apr 25, 2024 at 05:16:12PM +0200, Caleb Connolly wrote:
> Hi all,
>
> On 25/04/2024 15:46, Ilias Apalodimas wrote:
> > Hi Richard,
> >
> > On Thu, 25 Apr 2024 at 15:28, Richard Hughes <hughsient@gmail.com> wrote:
> > >
> > > Hi all!
> > >
> > > > Any ODM/OEM creating a board
> > > > based on the original device must use his own
> > > > GUIID to avoid confusion. If not we would end up with different
> > > > devices reusing the same GUIDs and upgrading their firmware with a
> > > > different one.
> > >
> > > Yes and no. Of course it's never okay for vendor A to use the same
> > > GUID as vendor B -- but if vendor A has two models of hardware (for
> > > instance model C and model D) they can have the same capsule GUID if
> > > the update can use a DMI match on the product SMBIOS key to identify
> > > the system.
> >
> > In theory, yes but we don't have any of these check in u-boot and I'd
> > rather avoid them and do it properly
>
> I discussed an idea with Ilias to generate GUIDs dynamically based on the
> board compatible/model, which seem to essentially just an abstraction on
> this.. But I'm wondering now if it wouldn't be better to do DMI matching.
>
> Like, if we have a GUID of some specificity (OEM, ODM, mach, whatever), and
> the DMI data (usually root compatible and model, but easily extensible and
> overriden by board code) then we can do the exact same matching, but with
> the added bonus of being easily able to tell what's up if something doesn't
> match. Generating a GUID from this data makes it way more difficult to
> figure out why the board doesn't match.
>
> But the issue there I guess is that the EFI spec only allows for identifying
> by GUID and not any other data...
> >
> > > Of course, it's much better if they have different GUIDs
> > > in the ESRT to completely avoid the chance of the wrong firmware being
> > > flashed on the wrong device.
>
> So expanding on the above a bit, the idea Ilias and I brainstormed was to
> use v5 GUIDs (which are deterministic based on a "salt" GUID and some
> arbitrary data which is hashed together). We would use the board model and
> compatible, as well as the firmware image name to generate these.
>
> Then for every board we want to support in LVFS we just boot it, dump the
> geenerated GUIDs, and use them. This makes changing the model/compatible
> strings a little bit annoying but it's workable.
>
> I feel like this is a "clever" solution to the issue of all these hardcoded
> GUIDs (and needing to add new ones for every board, even if the board
> otherwise requires no code changes in U-Boot). But it also feels kinda ugly
> in how it's just a worse version of the DMI matching fwupd can already do.
>

The DMI matching would need extra code in the capsule update code as well and
I can't remember on top of my head how we fill the DMI in U-Boot.
The capsule specific GUID is supposed to find a function in the firmware
of how to update the specified partitions. We now use a generic function
for all the boards which points to DFU, so all a board has to do is define
the proper DFU string.
I do like the idea of unique GUIDs better myself, since it's easier to
match the ESRT tables etc. But I'd like to hear more from board maintainers

Thanks
/Ilias
> >
> > Exactly.
> >
> > >
> > > > Richard, the following GUIDs should at least issue a warning in LVFS
> > > > since they only work for QEMU & Sandbox internally.
> > > > Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
> > > > Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
> > > > Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
> > > > QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
> > > > QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4
> > >
> > > Are these GUIDs that should be "never allow a firmware to be moved to
> > > the stable remote if it uses this GUID" or more "a firmware also needs
> > > a DMI restriction before being allowed near stable"? I'd err on the
> > > former for these.
> >
> > TBH those are GUIDs that are used by virtual devices. It wouldn't hurt
> > if someone reused those GUIDs but we can display a warning about it?
> >
> > >
> > > > I've cc'ed all the people I could find in board specific MAINTAINER files.
> > > > Can you respond to Richard with the proper company name & board name
> > > > so we can bind the following GUIDs to a vendor properly?
> > > > Richard any guidance on how this should be done properly is
> > > > appreciated, since I am not too aware of LVFS internals.
> > >
> > > The LVFS doesn't need "pre-registration" of GUIDs so to speak; we have
> > > have two deny lists of GUIDs -- one for "this is never valid" and one
> > > for the "this needs a DMI match"
> >
> > Ok thanks for the info. Is there also a check of "I have duplicate
> > GUIDs that aren't in the DMI list'?
> >
> > >
> > > > STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
> > > > This seems to use the same GUID for multiple device variants. This
> > > > needs to be fixed
> > >
> > > Is the DMI data different? e.g. you can see the Windows CHIDs (we use
> > > the same DMI restriction scheme as Window 10) using
> > > ComputerHardwareIds.exe or on Linux using `sudo fwupdtool hwids`
> >
> > I hope ST answers that, they are cc'ed
> >
> > >
> > > I've created a spreadsheet of what we do now, please feel free to add
> > > GUIDs (anybody!) to the correct column:
> > > https://docs.google.com/spreadsheets/d/1uPQmUrGA1KKsDPzGeg4xb2XOQEfsjDBBP9SQjqh31Wc/edit?usp=sharing
> >
> > Thanks!
> > /Ilias
> > >
> > > Thanks,
> > >
> > > Richard.
>
> --
> // Caleb (they/them)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
