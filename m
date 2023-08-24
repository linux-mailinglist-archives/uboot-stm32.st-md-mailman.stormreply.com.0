Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3778716D
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:25:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E80FDC6B44F;
	Thu, 24 Aug 2023 14:25:10 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79E9AC6B44E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:25:09 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d77c5414433so1682889276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692887108; x=1693491908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M8+rjZwOLw+THvEEeXAa+2bhqugLobjzaY3J/ujWik4=;
 b=poQzDt4/YarvAMcZQU4ttILRQVRQMRT+5tVzUJaeO5KsfS955yRw3VGn15PaaiaKVc
 InolWPpekNoJhMfVU/fQfC9Yw1RV2yOY32osShpgH9UPIp1wqlJ1B7OAJXajwJviLRzI
 3W2JIJOWF6taAmqfM09mdlJiCkXgN9pYBHRmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887108; x=1693491908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8+rjZwOLw+THvEEeXAa+2bhqugLobjzaY3J/ujWik4=;
 b=DmsVlzSjy3W/R9dRLJRezuEgDbaUSaDomeulTFx4xsP/SBrPkpj7HBGFqZhr/9HbSz
 EpSbUz33wu9gNCnX0OXDmfOiLB6yzFndOwTJ1NgMoTmOXCvQap6UL+VZa6+3Jn9e2/do
 H2XeO/6BsidPB/17TFl8X9vWU4E1no6OkAEeXoXcYPQ7BseCvijApRKV2HSxV9tAgsaH
 pmWkZK5tkWPVs+HQOjC/yItliRzkINALEw/6uK163wBzr+92TCHF30RYY+4qfJ1g4ykg
 sNIAQYhA4KL3D2D713r0eWMLWO1DSn7ophIMtMQwDbUUJSqpDYepWo/wIVfP0dScwu+A
 77zQ==
X-Gm-Message-State: AOJu0YzT9LXX9fcvj+8Z3TnAyhH0Ho5RmOX1UriVbOZfwm8EMkNOHk89
 E14ZSL2FJv6PUK/d3mnJJf/6aQ==
X-Google-Smtp-Source: AGHT+IH6pDKv3desLucj0CrnFSL0mbr9NWhqubCzqMK2O0Jhdcn60Qg0TXPF6e0PugsPeb22c+ymfQ==
X-Received: by 2002:a0d:d145:0:b0:581:5cb9:6c2b with SMTP id
 t66-20020a0dd145000000b005815cb96c2bmr14364604ywd.45.1692887108259; 
 Thu, 24 Aug 2023 07:25:08 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-37ed-1199-bcc5-406f.res6.spectrum.com.
 [2603:6081:7b00:6400:37ed:1199:bcc5:406f])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a817b04000000b00583b144fe51sm2585905ywc.118.2023.08.24.07.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:25:07 -0700 (PDT)
Date: Thu, 24 Aug 2023 10:25:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20230824142505.GM3953269@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
 <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
MIME-Version: 1.0
In-Reply-To: <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
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
Content-Type: multipart/mixed; boundary="===============8229723444862077645=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8229723444862077645==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l96QZSf5SqCc/NLj"
Content-Disposition: inline


--l96QZSf5SqCc/NLj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 05:12:45AM +0200, Marek Vasut wrote:
> On 8/24/23 05:02, Simon Glass wrote:
> > A '.stm32' extension is not allowed anymore, so change it.
>=20
> Why?
>=20
> This will likely break a huge amount of scripts, I'm tempted to NAK it
> unless there is a very good reason.

This is in the cover letter.  Today, buildman --keep-outputs doesn't
actually keep the needed for booting outputs from a build for a number
of platforms.  Simon's response is to stop having a free-form list of
outputs. With I guess the caveat being ROM-defined names (for example,
we still keep "MLO" because that is the literal filename TI ROM looks
for on FAT partitions, on mos of their 32bit platforms).

--=20
Tom

--l96QZSf5SqCc/NLj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTnaEEACgkQFHw5/5Y0
tyxrqQwAuIRlhEKZ+LZWqxqAgfuJ1DG05sf4crax7IdjGY12MHI5NYA9kRuRqiD/
BrOVLPZ6cOxtNTszdOzldOwWYSwD0CEk2CdeARov5LrsBqBbts3W4kGneG4SekXA
CzZgzRPz7IAvbA3o2nXIdvWLQxHPYo7zQuiF+PxZ0EllDBYt3ifuHLQn8O4pSiEb
BRC0JSuCBT67W8AsiXW1fJJ0BhZ3hSuWBxnf/a8j+zMGdoOYyaX/eVf5D8CmX29e
L1YGLmVLder6bH4FRnX7um2ciQmzvCSDCTXWCOCTlEEpbEPv9VhilTbgbSs0t8Zf
vSyLjk8RIOdZ0UUoMXRhd8Bn5MUXcma8XLVoWXKVGJvLDI8xkdms61hqEaWugtsA
sj9Ls+m5VZIFMZtyI169GaZIwHdCAUbif25XQNgKihm8FP9ADkbf/kFxyuzZVS75
d8LU+gnK+aacXgrzAVhLvrsDAvTnKDcFfteHi4mU230Hwhhg7UtC8rYSd5iW3HQU
uLgu3HnT
=FGIO
-----END PGP SIGNATURE-----

--l96QZSf5SqCc/NLj--

--===============8229723444862077645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8229723444862077645==--
