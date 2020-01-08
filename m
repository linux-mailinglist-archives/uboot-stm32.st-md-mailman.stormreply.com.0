Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F23134CE2
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:12:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9FDEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:12:06 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82F09C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:12:05 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id q20so3887740qtp.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Nw9ANY2jq9mst5L3pLnXJftByc7CoIEtdIDxn22Tjpc=;
 b=Xy+PgkStFBfKKXcGzRZZ4/xSOOYcJ/pIu/3lCNKHpA1pqbs/EYeJZUP8dFmKmsZBY+
 SQLpXoriOJo5/tUK/LGfx8Dx0CNZHTTvCK3pTK0nLpu3YBL4KxnSMIXydlfoCjyAmije
 sG8jdfBuaPik8BgsHb5f8O0XL57Ef1UIksuXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Nw9ANY2jq9mst5L3pLnXJftByc7CoIEtdIDxn22Tjpc=;
 b=qzSEDxQfcHAxKpHwNZdta5qHHQ00Sx/j+qAxcpO0k98fgNwW578Yt51rNxh8AWHFa+
 psl2+tim5SnBpZBy8exyJsxsWtZPzhmVvSIJSieB2kfdM0v4rD6vSc/pidgGt2cYbVP7
 uxMzEFAcU1oFF3GdW4jDYt2Wap3w3j4ss2HEfxkg+qrf9Yl6b0HTBWQdzz5AD3WtHRzs
 iEd81hnJ8DEngS5nYGq8Q02HW3FkdsU2MBDc0Dgg0myYjFJCnX5HSJpV4utHvxmMKSpU
 SI60IOflyKCofows5ok3bf22JxrsZ57H54HEYz3debhJEaclTHs4uHQXVq5XbbwITUqx
 xbiA==
X-Gm-Message-State: APjAAAWgjSBJgdqwWIvlpdjlKYQN332hglOlm/PA0WtXR6uxQMWcsygQ
 JbvUPAP5cGFVumCaO/VjZgmqDg==
X-Google-Smtp-Source: APXvYqxM/XHdr+XhYMkSMZud2ZTGFmb8/uFOetgUI+JlTbAyWBqJwDicPw1u6WfzBgM9Fyvqod6DLQ==
X-Received: by 2002:aed:3242:: with SMTP id y60mr4971314qtd.254.1578514324422; 
 Wed, 08 Jan 2020 12:12:04 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id g53sm2092692qtk.76.2020.01.08.12.12.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:12:03 -0800 (PST)
Date: Wed, 8 Jan 2020 15:12:01 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201201.GG31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-5-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-5-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 4/6] remoteproc: stm32: track
 the coprocessor state in a backup register
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
Content-Type: multipart/mixed; boundary="===============1916266471827731877=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1916266471827731877==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H7BnLk9CMipoMykF"
Content-Disposition: inline


--H7BnLk9CMipoMykF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:31PM +0100, Fabien Dessenne wrote:

> Update the dedicated backup register to track the coprocessor state and
> rely on that register to compute the .is_running() value (which expects
> a return value of 0 -not 1- if the processor is running).
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--H7BnLk9CMipoMykF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN5EACgkQh/n2NdMd
dlJJag/8DBwD5LH6gARzjk0M15adBa+4lMtqyMIAqSFAaowCOh+N2GQuISX4pJ/x
Y6US4bsbFE4GymWwFF53NlZfJRjlcVwCMd6d/M303ZbYA9l4AqGstOzy2yDIT++R
ulRB+9ZmzLolTojulFqa44kr0SaOkKEu89Pex9gS4A8kzTn4cTyaCj7+zjlE9L/L
fYji/Fj/ajDca5zt8W9vjqw5ydHWRUO+nGazAcMhGTHnPDeJ1+B/Db8ZmB5LaRul
OMZE1AHrWiow18OrvsTrAYUj+fLYdJ6OnJqRKgGcrnA/h6mqZ8T5cLcxs2qIkwRN
ai3N1wlcF2kk3xOIejA+wAlWUpG2D9Zmn3JbVoew/sI/MGQWAMyFFOyPA/m0ANiy
QXR9FkXIZdHX/G8A3lJasJpAGtoXlKVVxW7ZTysk4J8cTwiRxjufav7J5ume3fG0
gh2KEeWOeF5ihGqe6Ogtyz1u+mtpf701+OBpeKVfjhcaA0n/Qh0VEaKYOuH4pfnG
x/zVUi44SD4FFrgwflldxXL6Y+fKCLKP+VLEzCuG46WTRHkr/7xoOmQHDsovufff
s4V0FdjDF7hZxUMDGad9F6nxtxD6IC6czXT6UZfHE3Dej5jAJFucrOQr5zX+Zru+
lqdA/JoYxzV6eAobHt3iF6DDYSHmeDcOPr9RSJf80I4aDtm1DIg=
=ePwe
-----END PGP SIGNATURE-----

--H7BnLk9CMipoMykF--

--===============1916266471827731877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1916266471827731877==--
