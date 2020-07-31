Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D751234D3B
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:40:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD11EC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:40:51 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F3BFC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:40:50 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id ed14so14826749qvb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iyr/FErM+jsaI/t5EFdIqRQb64clUNRoWsX10fcf1E4=;
 b=qpNAPemnc5vzQOcmsysdnTWm3zTKAXwlw91F4S12688IG8qCP6mml0nPMJwlxuG6Z5
 OnYv88zBqubNMa3Hx1ju8B2cn4P0Bidb6ZhvOmXS1IuK3kV/KhtSX6HeNrGU58sASkcL
 V4971lzO95Db/ThSOH+ID7mEWkaIkmcbUc/2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iyr/FErM+jsaI/t5EFdIqRQb64clUNRoWsX10fcf1E4=;
 b=amXjMIyVQiDvC2C+eO9Ebibne6yHzby1HdXe9lXdhbhX48oEdU4NXyNS+bnfaZKoNl
 h76nizWtwj5RUQ0x9ijNhuNW3LStqBXHVJqjC1qukLTk52cVBtoeg9le5JaYPhj+UvVT
 zs/cvJ4g+dMlrvweo57tMpdLjk9rJdzgq7VA7a3mHMIZ7g4tnB34rpLa2zs2+X1kaDWU
 xpZhTDS0cSlNjKMezfMRLhXnURv4qYTG0T6LAgT1C0OSBuwbK6xEVUZkMY0nTRdsYBNH
 gO62ziSrBVfTqDRchohSeLiNGJz2Xwx/9/Z6wmjdHTzE6VU/4so8NKF6qEyWDCPtWdv9
 MBeQ==
X-Gm-Message-State: AOAM532wfb+6TjPRq0/o4b0wdjfSx6Xm8XvMSifn2IjUwmd59Cxd9cDo
 ruWUju6DF4gbZaQbvy0siiXdBw==
X-Google-Smtp-Source: ABdhPJzHf3HF/3xKffj3NtRl8+4S62yf89vONjKQ9qNpHF+6LHT+ePtbZZ1+wnCKWsRaZ9Km5nbJRA==
X-Received: by 2002:a05:6214:1467:: with SMTP id
 c7mr5996879qvy.233.1596231649148; 
 Fri, 31 Jul 2020 14:40:49 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id c70sm8024768qke.109.2020.07.31.14.40.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:40:48 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:40:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214046.GX6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 03/14] env: sf: avoid space in backend
	name
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
Content-Type: multipart/mixed; boundary="===============4598098774945167182=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4598098774945167182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xFQBzfy8IMmn3THN"
Content-Disposition: inline


--xFQBzfy8IMmn3THN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:16AM +0200, Patrick Delaunay wrote:

> Remove space in ENV backend name for SPI Flash (SF)
> to avoid issue with env select command.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--xFQBzfy8IMmn3THN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj94ACgkQFHw5/5Y0
tyyqsQwAm1nS7Cl2I03cmqKgdJdwVOpdT+iwqXByke0bcXN7cyruMjmKX0G6rmiL
kg7SAPqtSmdc/bcokMU4DrrKfwtGpwHTL7PtJZbE43+J4Yiws4Cjtx3D3DpqNXYK
QpDrj5jy4GaI/1aNAjyUQR7bFk5sA+7z9bw8uzhlJmBrP+mW1ikgIE3c55SufUFU
Eb7zcgPa4FlgJ94QPRNF3FjHhtw6RteUcZjMUe+7rpZzU1CsznwDKdjPlxmX8uyb
R41JqpTDuSQ5ECSsfHF081IRsey/hxbc4eNiJVM/t+/NfubmXCtLUDJ1B2c9bXe0
CsWMPSnmzqmQDCZzN5gaWzR9gBW+Y4P1qiB9WV/hwy8eBhBf2/et/msP2V+cBlFT
whVUldhky4MqT8PLAK9I3k2xuF2VdeVrGC/jEeqFnUu7cq0DphZswWwNmJ0AFfxj
wKNzLUYsrechKpfZi3xeEGTc9FvH/E0o0DoNCLcpP0Jmb1/ghPpj3WAaB9lX2mbG
NSr+FGke
=c1io
-----END PGP SIGNATURE-----

--xFQBzfy8IMmn3THN--

--===============4598098774945167182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4598098774945167182==--
