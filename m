Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6711496C4
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 18:08:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBB35C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 17:08:34 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50B40C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 17:08:33 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d18so4127088qtj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GmZoe48nVKErG6/WX/LSYOXZa/hsDaTwGCCFs9sjPK0=;
 b=f/Q4/Ia7NC6qrR/7wqIDyMr38DhsDJ79wdzucXuDyVztG8B50lghg5IBCX/SxE3PD2
 xzqAgiZAGQEt+OW31V8Ptt2DzKTyRaEZ3zfd4+/cSOqPYktRGFKfdfT4KFTP/6lo31Lh
 +zQdRbJaF4xuU/xooruHjntzfdXGXNd9YOxIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GmZoe48nVKErG6/WX/LSYOXZa/hsDaTwGCCFs9sjPK0=;
 b=DblpVvuPUYMmJ1wZcTrPUs+37pOClo6drDIpQO54TgX6j2mCQvl95QJffOIM37G6Tm
 TYQU6/nxwXMBStUp1k/k8GQtgqckk/tpghahskZi0at0A4jBjLArqIPDSP6tO/BtZ0CY
 xHPyeT3QFsYlzjFA6yU7jlG0hy99MjLPvRG1FPJ3s9lS6f4FyCJLAb0G0x5T0xh2FcdV
 S/BVIVi2P5/E5E7m1I9SFFZsx+AlizV3myKKZH+feK7AjbUeJ4/4j2gHstCzyK6yZEWF
 mILohUvw3SlU+QSYh6pfnQ0zQo8NUwfUxNrmLl8NW7aLSAYSMZWIb7ZweBnwQrgaOHWM
 wYsw==
X-Gm-Message-State: APjAAAWQQqKDEs1om6j52SHBQzIa1bxxd2SfQxNTnZUNVIUGdBCJlM7a
 Brk2y92U4dn8v1KIN6HNmUJGtw==
X-Google-Smtp-Source: APXvYqwwx1SQQdrKxIJOyNRLoRq/cJ1V0rzLPQWGjUMtBTUG9T8GhcaLTQG7a/p6gWQ9DaNZGOQy7g==
X-Received: by 2002:ac8:209:: with SMTP id k9mr8217914qtg.290.1579972112176;
 Sat, 25 Jan 2020 09:08:32 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-3dc3-97ee-c77e-aac0.inf6.spectrum.com.
 [2606:a000:1401:86dd:3dc3:97ee:c77e:aac0])
 by smtp.gmail.com with ESMTPSA id w60sm5676010qte.39.2020.01.25.09.08.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 Jan 2020 09:08:31 -0800 (PST)
Date: Sat, 25 Jan 2020 12:08:29 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200125170829.GB26536@bill-the-cat>
References: <20190920072012.17841-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20190920072012.17841-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Quentin Schulz <quentin.schulz@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, u-boot@lists.denx.de,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] cmd: mtd: solve bad block
 support in erase command
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
Content-Type: multipart/mixed; boundary="===============4374582383222769656=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4374582383222769656==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DG78IEnUmLKoW088"
Content-Disposition: inline


--DG78IEnUmLKoW088
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 09:20:12AM +0200, Patrick Delaunay wrote:

> This patch modify the loop in mtd erase command to erase one by one
> the blocks in the requested area.
>=20
> It solves issue on "mtd erase" command on nand with existing bad block,
> the command is interrupted on the first bad block with the trace:
> 	"Skipping bad block at 0xffffffffffffffff"
>=20
> In MTD driver (nand/raw), when a bad block is present on the MTD
> device, the erase_op.fail_addr is not updated and we have the initial
> value MTD_FAIL_ADDR_UNKNOWN =3D (ULL)-1.
>=20
> This case seems normal in nand_base.c:nand_erase_nand(),
> we have the 2 exit cases during the loop:
>=20
> 1/ we have a bad block (nand_block_checkbad)
> 	instr->state =3D MTD_ERASE_FAILED
> 	loop interrupted (goto erase_exit)
>=20
> 2/ if block erase failed (status & NAND_STATUS_FAIL)
> 	instr->state =3D MTD_ERASE_FAILED;
> 	instr->fail_addr =3D
> 				((loff_t)page << chip->page_shift);
> 	loop interrupted (goto erase_exit)
>=20
> So erase_op.fail_addr can't be used if bad blocks were present
> in the erased area; we need to use mtd_erase only one block to detect
> and skip these existing bad blocks (as it is done in nand_util.c).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to u-boot/master, thanks!

--=20
Tom

--DG78IEnUmLKoW088
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4sdg0ACgkQh/n2NdMd
dlJ9gQ/9E1ShZ9bw8LVp1o0z3fk9yGq+qeJ/arajjYTS8ZZw5B2saZOV/GRBcYY3
/bR7CDVfzFk+Z3KgZhzeq+xWlvUXoj37VJXBgechfKs9SBFKiXSv3C6mu9KfPqVE
sQmvgm039tTsxBUu8bnSs2V2Q2HGX8HmOkGZThCARRBLaoyueHG03k/KGxo9AW6V
pjxznrBT44hDtL2zGwWCfEW9WYaDlL+DThRcOlEhy0OcO8LPDivgv8c038zohZus
GHe12KksyW1pHWbCd81oxMTbdEdF9unmHF/GKgb5qHqXdenCGLVx937D7eU9yQOj
IsRe1Usj3RA+lG7CZp0YM8D01Srm69tPMy+k1CFTa6Hh/DDC1xbTxxbSO6RaIPF3
tO3QNSVXXdTeg9F+S83CHa2vN6cZ7hqVxmN1UkciCZvgKUsNCPQFfuAl2caRTCkR
s4JWVuV89sSXxgFbKFNwaNKpXEsZBoqZYlSfT7hBoI5TwMo9k2lMjHIeUr36CU4k
9dgFbiOVkKqnTXOj50UuuXFh9RHB+gx55+wrywgJxRH0tNbO3XOu+n2ZJOeh1sF1
2wi4aSh8RUXKrbFbOevqwYcFDZsBIm/h01rhakHJKovH+njHHbXdlX+OWfUtOxpQ
ksibRNUD++4fdDH2WbNnPIJEy2Y2feFjrCHFonbyaIMc0h/U4Tw=
=L6gP
-----END PGP SIGNATURE-----

--DG78IEnUmLKoW088--

--===============4374582383222769656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4374582383222769656==--
