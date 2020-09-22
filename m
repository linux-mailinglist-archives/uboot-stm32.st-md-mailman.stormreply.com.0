Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A32744FC
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:07:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E345C32EB3;
	Tue, 22 Sep 2020 15:07:58 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32B8CC32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:07:57 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id cv8so9668092qvb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hHKAq0FS4PT9RNBx9HthHDWTMu8i1TgFp0v5BPNyk2U=;
 b=WTxXTRCMqCwqG6/iWE0Jlos7pIXg5TbRXCuuvHq5L9G8it7ncQ64tbUaOWHTfUpjVx
 jFW0caNWCZW63V6JAWvSaGq7rO9ZQlS5fvvPF1ExWYIT+P1IjeaaGRdQllsf5JEdD5I4
 wKbqEBj2llAkq7+HRUIb9Xbsj+yLF8FJc0qf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hHKAq0FS4PT9RNBx9HthHDWTMu8i1TgFp0v5BPNyk2U=;
 b=hyoDfXgExs5FTW5pS1Tt+y1m3SM125FsfotdcDfBnctag2QU1CJ+rvM1oExe7gvPM+
 kpoSe4FkWuuqrn4B1uXfGS/Qx92JqjpZopvaX1To8Kq79LNSGxoqF3u4nJSvgIGIjmaW
 vqUHHWI1+d5lKB6pah80SsbfYE+eBaQgzDJ09cZK3jFNWtMiQ5hlnwKOKKHzl3CsIi75
 RNAlrY2BY6WBz70nKy6ga3oEFv/qEFGYletBPHFWQTAkfMeLJzNqDnVtuRcsNIZsTf+4
 OSTyEqxah5fbIuNxkFU2DJEA0iG03X9jFEOZRCMurzGudQavToBjkQ7z4DQuzntNnDPB
 bYwQ==
X-Gm-Message-State: AOAM530fS9ZG8zq3JdNPry9LANQDR3IfJYdvGJuPOM+OBp5kIWmfFnzn
 ncskZoQbz4VJvDwcGNSvoEGyBg==
X-Google-Smtp-Source: ABdhPJyDWwtQH9Oucz1fV7BYQjmu8iAGbk9EbacxVik5VBDH+Mwdwuyz2KsezJ6Vo9ZjQyP761ky2Q==
X-Received: by 2002:a0c:f04d:: with SMTP id b13mr6414057qvl.31.1600787276012; 
 Tue, 22 Sep 2020 08:07:56 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id u55sm13449029qtu.42.2020.09.22.08.07.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:07:55 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:07:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150753.GE14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 3/7] usb: host: ohci: change trace
 level for phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============0385595514984380008=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0385595514984380008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CeJGzupbOM8Uylfo"
Content-Disposition: inline


--CeJGzupbOM8Uylfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:42PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the dev_err can be change to dev_dbg.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--CeJGzupbOM8Uylfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE0gACgkQFHw5/5Y0
tyy4Kwv+N0upbQDPjAGKIV+5GWU5l1avjaT31Lwkw+k2NExP32LAXSkCO934x5W7
oaoqLEQTYnJg6Zii8YxYAgvtEJCFWEmsrBDhDzMx3i9IeYTxcFQdMRoNdEtDNP3B
xFk2FvL4++EoxAVftChJyxM9og7rEQgtrAitKVanpXC9BNuGryrAJLFgo8ls7zI8
UUbBtUn1kpw5EVufmgc804Ag2n+fgqZQtDTThzlDOtTjoOqruhADRDHkZxyGO//A
UoMuNeJIgWq/eBJEN8EGflJeZPDsibIh2MEOln+GKebr9jtj8CgYmV94mIeGG20z
hWvboiiU6oXzvjjjz4y2xc5VZttpAsDTraIxgjMoZRRNvaHufc0Nc2soubT5yW6R
huTCqZtUar+2LfLiNTmlHMpyQL3oQe1BpHHJK/RXpHvX4Ul7HYLQmH3GOvgm09+b
PQ+ypBn6MX8eQUSyJ7FUIryXjCP4H+rq3rf313TS7yLDCF5VjlWBuqIu7aH90DfD
uiUYTW/e
=/Y5r
-----END PGP SIGNATURE-----

--CeJGzupbOM8Uylfo--

--===============0385595514984380008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0385595514984380008==--
