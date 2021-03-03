Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D528A32BA1A
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:08:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F3F1C57B53;
	Wed,  3 Mar 2021 19:08:54 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FEF1C56634
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:08:52 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id s17so7722626qvr.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=taGmVy89jtsWaA4JMfw7osy/2MkXluI1deR+ynAK/XY=;
 b=bZg6q6yQ3NqnhNUusopl4PhVB+s/LizIQdEaXMsPiNr5beJxpCFyaO+4oY3OkiY9PP
 LuAPN/71OLwDGZ6nFqnHL1pn10CXXI6xPwa77z3WlcI2SyfaWC6he/WXwNX/d7MboS5u
 WChg733fZR/a0p85ipIogGtyGyRSisw6h8038=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=taGmVy89jtsWaA4JMfw7osy/2MkXluI1deR+ynAK/XY=;
 b=q4wEG8isV5SACkeEjL6pGXcX3swf2XSVqsVhCx27pA59hcBI90sysM6NiSkMGIOvgV
 dCb46nhmfTtqHu7RukXrzo6KmY8+ihcQLG8l2e4yZCyOckglJ2Ohew/5ZAQIb8ilaAoB
 93gQ9oB96OCyHPj0LKszSbOctnB4VWeaC3iXg8ztlOnDyWakrclB1MBmsgtE6Ar9Z8EI
 EJYy7PyNR92I77SIqPtJWRpVjsrMo0XKc39tIeYMxec6/HlEU8YImQ3c0qTDSlogkH+3
 ltXky/jZFzX7UdTBWRo8PnDGbAPfKkPynX8rO90r8TH9oeZx1rUMXdMjtiXzmlIK889a
 wbVQ==
X-Gm-Message-State: AOAM532/6WipPCL9n1C1Zs6A9R9klviuP1SELIS3GnkuDxiGTJwkt19m
 SFlHXjfbinShzpLiB8ywQMBOmw==
X-Google-Smtp-Source: ABdhPJzyrP2OtDbMMiRh10bH4EN+m2a7N3lOhm7vYmxuZDO+2foPsKHWKvcx70tsGuk71n+uBUKeYw==
X-Received: by 2002:ad4:5c4f:: with SMTP id a15mr640169qva.41.1614798531265;
 Wed, 03 Mar 2021 11:08:51 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id b63sm2516687qkd.84.2021.03.03.11.08.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:08:50 -0800 (PST)
Date: Wed, 3 Mar 2021 14:08:48 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190848.GN1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.1.Id05ed63c4c424d0307d757026ab2f22621b5481b@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.1.Id05ed63c4c424d0307d757026ab2f22621b5481b@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/8] stm32mp: update MMU config before the
	relocation
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
Content-Type: multipart/mixed; boundary="===============6298987841511553538=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6298987841511553538==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline


--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:32PM +0100, Patrick Delaunay wrote:

> Mark the top of ram, used for relocated U-Boot as a normal memory
> (cacheable and executable) to avoid permission access issue when
> U-Boot jumps to this relocated code.
>=20
> When MMU is activated in pre-reloc stage; only the beginning of
> DDR is marked executable.
>=20
> This patch avoids access issue when DACR is correctly managed.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3sAACgkQFHw5/5Y0
tyyC+wv8DQVdyRM4jVxC6zVDLSdvqQKeIto32xYS3eeJlk0ub6z6YZHU/uijXA8R
L5Hq2XYurBhFpBtEVZ/wSbFxLaSeq2cRKOAUWB36nAIjav6iAONGQbroUww8sMmD
fetn4GHgbhlW+rGhaI7yRGqKR4Tyu9oElRg1GxjbrE7pkuzr6l+q7ZKUPqGZ6wB9
9TVhQcL+D7wA5KUBeii2j+VIYE5nd0pFMpJAkMj0HivnPh679u0tzjK2b7GSnlkg
ENqQmHhL9wuhp1PZb/wC4PlauiLYxRXks3AS5ON0DlrwSLW11Pfb20SNK9hdmfT9
TrpXiSiYSBcvumUSF03xxVt5nPKdGyrcRFD4XQeK6gFCYUW3nQgBQQMlxjGwNtTN
WHAgDEn0AlY43xxqhimxe4PHHwXs2+ZEvPMqYoRanrejphwDnqC1nsooTUUxHFl/
Q0GwsEFHIg8IkSxT/DielbJJ0UtRVQZmNcihd4C+2Ie5N5iaQMdnwT6a1q0ADLbj
0PVBJ0+N
=vx/1
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--

--===============6298987841511553538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6298987841511553538==--
