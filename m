Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE21436354B
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Apr 2021 14:45:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7690C57195;
	Sun, 18 Apr 2021 12:45:55 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 409B3C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 12:45:54 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id bs7so15134893qvb.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 05:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uycRhGjPAsgfSnrw7RTCftkuzFnqfV/th1dsteTiqcw=;
 b=ALTExf6uluy0di71i2UD9DMfuKOi9QLf3C8nCfC+9E5A5T++B0iJYkw9vH24h7VXaM
 I9tRzXghta2YkWndL0ctS+Etiyq98okysUy/atsv5ZJUyhfXplEKicXK9HbzKFeXI4t2
 OeASeJT+cKDd4s6ZRlAoggUcLVKFsMQKArZKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uycRhGjPAsgfSnrw7RTCftkuzFnqfV/th1dsteTiqcw=;
 b=TsD77zUi0MCfaW9wLFfjdLlqI6g7f9BNjbO37mnbcGmmVfE3gUkS7xchjul1cf7Zup
 fmXRUEE+iE+SWPIWrRHgHZ1wV5TVWOmoc0feLZwQF3cZBN9OtQw0HfXjg9FZhCOe/k9o
 O2e2m8UmbKsZjHkjrIrc3yQ7VNTtLmRXb3xPGodVc8qYsqhqnSxykBXKxp5j5e+pKQqt
 M85LKadD91jvs6RfYt9UI9Ci39gkvQHmi2TBCuFBpNjv/LrXf9xgK6TBbiKT8I1RGg9k
 +p18GrmGLSGByfokVt7sCE6KIYWhi4ki5XhnaXz9JmUxRraVlBRMcVUWEJ1+sqJGTC6x
 q0Bg==
X-Gm-Message-State: AOAM5328rZXXVsURBq52Z4CMtHInNlEWUPKtFD5pOu9qNRS+rSX9yBZq
 llYH3OxyvLn++jo6mGuA1lY71A==
X-Google-Smtp-Source: ABdhPJz4SAA7parB+46W/H6P+t//gFj6/pyx1kxddS0EYLom+JPGVRfRFWmbpM4LymsKgBQstnvPBg==
X-Received: by 2002:a05:6214:b08:: with SMTP id
 u8mr17027047qvj.9.1618749953267; 
 Sun, 18 Apr 2021 05:45:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id u184sm6537116qkd.82.2021.04.18.05.45.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Apr 2021 05:45:52 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:45:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210418124550.GQ1310@bill-the-cat>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
 <20210209114849.3.I10fb7cded95e008428ff08f4f1e6f785cefc4d0f@changeid>
MIME-Version: 1.0
In-Reply-To: <20210209114849.3.I10fb7cded95e008428ff08f4f1e6f785cefc4d0f@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] env: sf: add support of command env
	erase
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
Content-Type: multipart/mixed; boundary="===============4086102640995570243=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4086102640995570243==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzUrAFRz6W7bSIGS"
Content-Disposition: inline


--uzUrAFRz6W7bSIGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 11:48:52AM +0100, Patrick Delaunay wrote:

> Add support of opts erase for env in SPI flash;
> this opts is used by command 'env erase'.
>=20
> This command only fills the env offset by 0x0 (bit flip to 0) and
> the saved environment becomes invalid (with bad CRC).
>=20
> It doesn't erase the sector here to avoid issue when the sector
> is larger than the env (i.e. embedded when
> CONFIG_ENV_SECT_SIZE > CONFIG_ENV_SIZE).
>=20
> The needed sector erase will be managed in the next "env save" command,
> using the opt ".save", before to update the environment in SPI flash.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--uzUrAFRz6W7bSIGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8Kf4ACgkQFHw5/5Y0
tywK/gwApslnIc6e4p1h2usVatMcrwEB+qrophKW5bKu//oXjEqbCbfLIGGXWg49
BW0CWmALNSt7/v7SLM9qU9HSTD0vbnU6+X+QfR/W8nuZ9xl/KhTZDYnXCboj8E8j
eOLjIgk8pMm4gxQeM4u/q9eFhFR9sQZY53w0jYIoFRcvypZkXj56Jti/L7xbdciv
kDkUeSZoJiJE5J97bJ1rjzbVWEpm83btvrDArYPzC7M2hh6y/bJhLjITGY0yHRe3
C6DT+1zGIqQxpCR0sn00pAgHTEIEYNZtpm9ZUyau3VzjNaVBtffYikAy0YJiKDUK
qmfzSFKiLSix53x5oVR07GKCeXyWYPY1ZEowXHlceGiGhhCZwxiGvegI1o5l6MLG
E16WPRCp8k/PM1WfqBIloB94VRNQJCHRPBt1j+inG+mcVo6BsUzCji30XmaZz/yv
x0db7r/eLQ4a/5DScPhDPwxndhKfX3yuEckp/OAgGfpHc4mgJThjWBbjjdCyhI4h
S8MKbOte
=P5J0
-----END PGP SIGNATURE-----

--uzUrAFRz6W7bSIGS--

--===============4086102640995570243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4086102640995570243==--
