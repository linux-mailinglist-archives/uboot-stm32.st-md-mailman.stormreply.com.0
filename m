Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7075A7873C4
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 17:14:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19462C6B44F;
	Thu, 24 Aug 2023 15:14:24 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFFB1C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 15:14:22 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-59289606ca6so233907b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692890062; x=1693494862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s1VJt08D8neLd/fvyQDw5SBQkUW4MVJb5NLNgmZTks8=;
 b=fIPJOzCTRHWIbh3qOoX+Z5kaXuxprAlppri6TmLCKi4FLzoPZe6I27g2UxZrm2LJh8
 BhoStaD7/RLNHo/Zl1GH0QCHtwUUk6t2C1I8C87kFL3VVh1IZYcqq6GRPCisNeXXmZmp
 SfO8GSBUP1XIxWxUWpzwE/oNz3QWyLYAVl37E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890062; x=1693494862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1VJt08D8neLd/fvyQDw5SBQkUW4MVJb5NLNgmZTks8=;
 b=VhEo2NTfixdL4vdcfF9bOoD+a1IHJvJjWI8OyanjvBKju6+A3j391dHgW3blhdDotg
 K968hf+f+cHSYKcD+pCcO6fyD1wmQgWgL4a4Lv5fqMiv4gi4GfA7Fta8TUjDge8Wzj5a
 KdnqddJtmon5yuo/62qIHqSd6Lpq9iZXEd9KGcfT8YzGLMGy72PJwI3KZ8uI9OSUvk9e
 96JUfexY3kag6mXFl3csIy4rvqHKRpZVb4NENxXhzW/mejYkPIfMPtVkoyymn7p2hXYF
 EoPDr5NRBy6uKgvVz5ox2KMK5Jen/5GS3gzs2WPBS2mzCI8RLaE6lu0/nU8wTycLSr0L
 oozw==
X-Gm-Message-State: AOJu0YxoJ+dHkIUwhNk2PRVX2tN1MgjLOpXKGlwBQypWoxyIlOOXwB+t
 JFsF7QUvnohCpDPL9XtjYdjqDA==
X-Google-Smtp-Source: AGHT+IFxmSiYbvodVecLQS/AjUM0gKYLdkaUTm5PjaJKQNQJnqBcVq1j+34wybPwgCXuAJVk60tMpw==
X-Received: by 2002:a81:4813:0:b0:583:cf0f:152d with SMTP id
 v19-20020a814813000000b00583cf0f152dmr15024779ywa.6.1692890061681; 
 Thu, 24 Aug 2023 08:14:21 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-37ed-1199-bcc5-406f.res6.spectrum.com.
 [2603:6081:7b00:6400:37ed:1199:bcc5:406f])
 by smtp.gmail.com with ESMTPSA id
 d77-20020a0ddb50000000b005794a9576f0sm3980842ywe.9.2023.08.24.08.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:14:21 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:14:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20230824151419.GU3953269@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
 <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
 <20230824142505.GM3953269@bill-the-cat>
 <4cbffed6-6a07-1a56-bf10-7303e2aff78b@denx.de>
MIME-Version: 1.0
In-Reply-To: <4cbffed6-6a07-1a56-bf10-7303e2aff78b@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: u-boot@dh-electronics.com, Vikas Manocha <vikas.manocha@st.com>,
 Simon Glass <sjg@chromium.org>, Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6770973246367272577=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6770973246367272577==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZSfaC3nGqLOtAzN6"
Content-Disposition: inline


--ZSfaC3nGqLOtAzN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 05:09:07PM +0200, Marek Vasut wrote:
> On 8/24/23 16:25, Tom Rini wrote:
> > On Thu, Aug 24, 2023 at 05:12:45AM +0200, Marek Vasut wrote:
> > > On 8/24/23 05:02, Simon Glass wrote:
> > > > A '.stm32' extension is not allowed anymore, so change it.
> > >=20
> > > Why?
> > >=20
> > > This will likely break a huge amount of scripts, I'm tempted to NAK it
> > > unless there is a very good reason.
> >=20
> > This is in the cover letter.  Today, buildman --keep-outputs doesn't
> > actually keep the needed for booting outputs from a build for a number
> > of platforms.  Simon's response is to stop having a free-form list of
> > outputs. With I guess the caveat being ROM-defined names (for example,
> > we still keep "MLO" because that is the literal filename TI ROM looks
> > for on FAT partitions, on mos of their 32bit platforms).
>=20
> Why not just place the free-form files into some output/ directory and be
> done with it ? Then they can have whatever extension they want, as long as
> the output/ directory name is stable.

Yes, an alternative here is to just extend the list that's removed in
patch 2/6.

--=20
Tom

--ZSfaC3nGqLOtAzN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTnc8EACgkQFHw5/5Y0
tyzvyQv+MeDLK95du07wAhtZZK61NKOOhy0HC8/arU8ccE0RlA8Go00e2eJ6cuGO
WDyqOlVe9KSyOUlcPyftVuE5PfxIjuelg9b4qWIasQs2qV5JLIA8N/kNT9vyfX/0
2GFvYqe5/IIyAhz3Mc+YEseqf7R0PzExq9B1tTi/HL2Ko7vhCTD7Ds/kMc3oB8H7
AmAAFe+Ht2QOVg7W2uOlpfZ+nCqMXTdvKsFqDj5BVzWQpe9984EkMzd5wbk6KcCe
G/IEsWdYWOP2Xj67WlBHuM0f5oDe17D1rFfKbBTdjtRWb5IdwZ+X6P/k66m+DqIx
sy2HI22Udqotmgn38kyEH0Q6oy+kuTmeB9IBrNquBGZgEAoqnGMTi2dZwPhrfdca
j2jvVxrcUkIR95/NrAS3FchRJmJNlg1yq3u+Vtro+/b/lsvxThT9sYgowsUDA4Sk
fDqeK6A8OK5WkzHyDDxFLmQQG4AC1a7Rl1BlwGJW8RSsWO+UJ4VcFvtmKDuOgLvt
I+O91imz
=amKo
-----END PGP SIGNATURE-----

--ZSfaC3nGqLOtAzN6--

--===============6770973246367272577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6770973246367272577==--
