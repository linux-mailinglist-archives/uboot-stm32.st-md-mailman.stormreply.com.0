Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD696C5338
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Mar 2023 19:03:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F361BC6A5E7;
	Wed, 22 Mar 2023 18:03:37 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C57AEC01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 18:03:36 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id c19so23726371qtn.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 11:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1679508215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nQLe9c6RsBI849sVhGdGaO1rHS4YeytGxXgFM+8vonY=;
 b=nTSK5nYjOlE9iNf78TLcoF9SEiPNvuih3gbLYs5xieuXAc5lDr8wuetgZJk+Ue0J0j
 L6hcHxAHtn0XdUhq8E6m2M7nYQQ106itOo4s8zzBL4ICOUpLb2sTq6rTU1S+7BKtrDK9
 cX3Yt2We/L8M5MVYyNwM/0XsbRDg5vAC4+nTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679508215;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQLe9c6RsBI849sVhGdGaO1rHS4YeytGxXgFM+8vonY=;
 b=6r7E19ILF0bggCQbnuL9OBNtOyjxo0PwpBMJHF/kJ4QcL4l9OlUbfmaWvCyt7WPnik
 dtNXAUKuX4v7bYNcKeOA7Q37RZ33JEb9nyGe9jqNwhU2Sz292c9qmRn2lZrzIU7vEOew
 ZpiDSO+sKdyqM/tEgmIwbzdyLtws7qiupmtcIfWDnR9yP09C7R5If+QGyesUmdYBKxaX
 OCJORzfuyLdjT2OzvpzFlF4Ys6FB/FbN2WbCVKKSq2OIHfi1E4lf7Ytmc+lNRcq5Nqnr
 Ze8MlgxyANEkuGVD9JFnyFMqEnYxdUfIZyJUWw8YhDH7MHJjGHKE0BSN/nTQ9BLYMvzm
 N7/w==
X-Gm-Message-State: AO0yUKUepslyfIcFrzd1u88OvDvsSbhaMHvuRi4F7/dFfNhw/RIR26wL
 93EutLVElgIy0H+s1ChJ39AypA==
X-Google-Smtp-Source: AK7set8FTOjE8nkBxQPqCAOXPezimI/O2Y/OS+aests1RLYGbZ5/3sRsykcyPP3MWQgVPGlOr+x3bA==
X-Received: by 2002:ac8:5a13:0:b0:3e3:8661:c6f9 with SMTP id
 n19-20020ac85a13000000b003e38661c6f9mr8322820qta.19.1679508215686; 
 Wed, 22 Mar 2023 11:03:35 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-8fb4-da0c-fb38-955c.res6.spectrum.com.
 [2603:6081:7b00:6400:8fb4:da0c:fb38:955c])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05620a057000b00746476405bbsm11685527qkp.122.2023.03.22.11.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 11:03:34 -0700 (PDT)
Date: Wed, 22 Mar 2023 14:03:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230322180332.GQ8135@bill-the-cat>
References: <20230308094912.1.I852b2b0fb85539e986a45dcfaf765f92e0924536@changeid>
MIME-Version: 1.0
In-Reply-To: <20230308094912.1.I852b2b0fb85539e986a45dcfaf765f92e0924536@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Mikhail Ilin <ilin.mikhail.ol@gmail.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] fs: ext4: check the minimal partition
	size to mount
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
Content-Type: multipart/mixed; boundary="===============2088232512119022561=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2088232512119022561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AYTSo9svf775g5QU"
Content-Disposition: inline


--AYTSo9svf775g5QU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 09:49:54AM +0100, Patrick Delaunay wrote:

> No need to mount a too small partition to handle a EXT4 file system.
>=20
> This patch add a test on partition size before to read the
> SUPERBLOCK_SIZE buffer and avoid error latter in fs_devread() function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--AYTSo9svf775g5QU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQbQvQACgkQFHw5/5Y0
tyw43gv+L0KeC8wK4Ida8gwIl2IIkQKe2MCome9HasToxDjKNE+6ajp6irWfpkHB
+qCWfxooU/23oZC5nidTdcUO0D6JBxT6j5K7TW+XEhaZ/Z3SqGjX/9HRgWrE+HG7
y1XgcY/zfne3TDtgUtL+GBc6gtEvK5r5IbYR+jukyIbptqUq+wRcRpvQKBOsYLV5
FWZ6onlQXeV6vd6hbY2/WoQN1ROXmFuQasDt3bGCpcK/Yyryt0AxA8O/yI/my9jo
Dl//St4D0uGzNzzt0BtFoTncKGatoc0+VqLsvXoo4opoD/L1yAnvs+Dvf9AwLF9v
J+TybJZXOkh/UVzmLZRx33+k0YFZRhbC1wvXMMnWyrHr8NxI/VE/i69w5PnbSTW6
Y1s+XiM12MTb0D0e/GPcbZoECF5gBjsYEoAs7iIOT8vtXFK8caklxiNalhVOVLWK
EiJIiJVrMDIcmVm4M8ck5LihIchpg31xdQZ69F1E07X+ezTEm61tba9vNj0mtT+O
L4i/KT2Y
=Lv5q
-----END PGP SIGNATURE-----

--AYTSo9svf775g5QU--

--===============2088232512119022561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2088232512119022561==--
