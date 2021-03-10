Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B605333C7B
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 13:19:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 196EDC57196;
	Wed, 10 Mar 2021 12:19:51 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 795B1C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 11:15:39 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id z9so15195210iln.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 03:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1tnsZu9Ot9oTzO9AP3uuaVMAhi0Xb/LJnKjJiuihL8I=;
 b=jZyluKC087bFe3Curn1EYMcKIatdGDEQnbywbhHHycmknzs9XZnwXm7S772yqoZ/dR
 2CNPWOZVbfhCpEuScOdVkSlMlDInd6MtdHXPmAcJST0fHPXorx1eM+e4obkEnrgJH3Ym
 xI/vXbc6LAqgzzzdwVkgqFwJEmOgrBx+HZn3lA+/p/2Yt/UFlpYGSOYpodcpcSSmakVq
 E0hMK3PODJuOZEwfXWZfEhdL5dpS7bwDRdgqJamq3xdk3zkLcb4B45MmCTZMeMpahCJu
 S9pWuxdYDvF3vRsqgKceXJmbTPO/Tj9cY27J2DFMTvzR79XX+1RWr7B1Xid1EFrWk08Q
 zHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1tnsZu9Ot9oTzO9AP3uuaVMAhi0Xb/LJnKjJiuihL8I=;
 b=pF5hfHTx5fUG8Qy8AGEOXJ7wp+suHnr0tCCNo5wV0cuRX6L8/OaPIGiv7N7pgWUs+t
 iQiArKIUkyDhKtaqD1bKV5BTsDfM/zq6k8MwEEDSS4XqEshAAn5QLhkGqjeUVpmTmLt/
 HKOARZnWY3IwgvvxDMnCeeqJQSnMrXyuK1TYtmO8eJEYEQ4h7j+0ud+TqFeFoTYJwdgO
 EaCsfEDvcvPyaHqe1gzNUj01aHaPPexvI8lYcT38or9JIRtlf3zC9K1WnBJC+BdsE8D4
 ZRhr57pqy3J1w/rhEcMtVQ1rhIbMUSuhRJcwNsOKov348gGImqTnEbLos/3w0FChs7vG
 sb6A==
X-Gm-Message-State: AOAM530T9w2mi5NrxMG/bOnMGekxCqGpCUedrmP3ziUNj/oOx1vcqt0x
 P1Ffe0H246yeXSp8UoakxAJ2R7qelWmbSzUxA98FAw==
X-Google-Smtp-Source: ABdhPJxRsnhPNEc3hY16irpzF1RPnap+jFFs/mpNIABc6JjzYuooKScy+oPqcBDCUipA027t8iE6IFUtveD7a2nQCGo=
X-Received: by 2002:a05:6e02:1885:: with SMTP id
 o5mr2044516ilu.78.1615374938065; 
 Wed, 10 Mar 2021 03:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20210310102719.1.Ieb141155065c9aaf05a0199ef688e1eb3ba0e621@changeid>
In-Reply-To: <20210310102719.1.Ieb141155065c9aaf05a0199ef688e1eb3ba0e621@changeid>
From: Sughosh Ganu <sughosh.ganu@linaro.org>
Date: Wed, 10 Mar 2021 16:45:27 +0530
Message-ID: <CADg8p97Gik+WJD0ak7Snn-k47M-3oCby_H-F3MQufnj4J-p3QQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
X-Mailman-Approved-At: Wed, 10 Mar 2021 12:19:50 +0000
Cc: Tom Rini <trini@konsulko.com>, Takahiro Akashi <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Alexander Graf <agraf@csgraf.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Subject: Re: [Uboot-stm32] [PATCH] dfu: dfu_mtd: remove the mtd_block_op
 error when mtd_lock is not supported
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
Content-Type: multipart/mixed; boundary="===============1561778605324184892=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1561778605324184892==
Content-Type: multipart/alternative; boundary="0000000000005ce7cf05bd2cc91a"

--0000000000005ce7cf05bd2cc91a
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Mar 2021 at 14:57, Patrick Delaunay <patrick.delaunay@foss.st.com>
wrote:

> Fix the result of DFU_OP_WRITE operation in mtd_block_op function
> when mtd_lock is not supported (-EOPNOTSUPP) to avoid DFU stack
> error on the DFU manifestation of the MTD device, when
> dfu_flush_medium_mtd is called.
>
> Without this patch, dfu-util failed on dfuERROR state at the end
> of the write operation on the alternate even if MTD write
> opeartion is correctly performed.
>
> $> dfu-util -a 3 -D test.bin
> ....
> DFU mode device DFU version 0110
> Device returned transfer size 4096
> Copying data from PC to DFU device
> ....
> Download        [=========================] 100%       225469 bytes
> Download done.
> state(10) = dfuERROR, status(14) = Something went wrong,
>   but the device does not know what it was Done!
>
> Fixes: 65f3fc18fc1e ("dfu_mtd: Add provision to unlock mtd device")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>

Acked-by: Sughosh Ganu <sughosh.ganu@linaro.org>


>
>  drivers/dfu/dfu_mtd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
> index ca67585a7e..ec40b8f6bb 100644
> --- a/drivers/dfu/dfu_mtd.c
> +++ b/drivers/dfu/dfu_mtd.c
> @@ -150,7 +150,9 @@ static int mtd_block_op(enum dfu_op op, struct
> dfu_entity *dfu,
>                 /* Write done, lock again */
>                 debug("Locking the mtd device\n");
>                 ret = mtd_lock(mtd, lock_ofs, lock_len);
> -               if (ret && ret != -EOPNOTSUPP)
> +               if (ret == -EOPNOTSUPP)
> +                       ret = 0;
> +               else if (ret)
>                         printf("MTD device lock failed\n");
>         }
>         return ret;
> --
> 2.17.1
>
>

--0000000000005ce7cf05bd2cc91a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 14:57, Patrick=
 Delaunay &lt;<a href=3D"mailto:patrick.delaunay@foss.st.com">patrick.delau=
nay@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Fix the result of DFU_OP_WRITE operation in mtd_block_op fun=
ction<br>
when mtd_lock is not supported (-EOPNOTSUPP) to avoid DFU stack<br>
error on the DFU manifestation of the MTD device, when<br>
dfu_flush_medium_mtd is called.<br>
<br>
Without this patch, dfu-util failed on dfuERROR state at the end<br>
of the write operation on the alternate even if MTD write<br>
opeartion is correctly performed.<br>
<br>
$&gt; dfu-util -a 3 -D test.bin<br>
....<br>
DFU mode device DFU version 0110<br>
Device returned transfer size 4096<br>
Copying data from PC to DFU device<br>
....<br>
Download=C2=A0 =C2=A0 =C2=A0 =C2=A0 [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 100%=C2=A0 =C2=A0 =C2=A0 =C2=A0225=
469 bytes<br>
Download done.<br>
state(10) =3D dfuERROR, status(14) =3D Something went wrong,<br>
=C2=A0 but the device does not know what it was Done!<br>
<br>
Fixes: 65f3fc18fc1e (&quot;dfu_mtd: Add provision to unlock mtd device&quot=
;)<br>
Signed-off-by: Patrick Delaunay &lt;<a href=3D"mailto:patrick.delaunay@foss=
.st.com" target=3D"_blank">patrick.delaunay@foss.st.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>Acked-by: Sughosh Ganu &lt;<a href=
=3D"mailto:sughosh.ganu@linaro.org">sughosh.ganu@linaro.org</a>&gt;</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0drivers/dfu/dfu_mtd.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c<br>
index ca67585a7e..ec40b8f6bb 100644<br>
--- a/drivers/dfu/dfu_mtd.c<br>
+++ b/drivers/dfu/dfu_mtd.c<br>
@@ -150,7 +150,9 @@ static int mtd_block_op(enum dfu_op op, struct dfu_enti=
ty *dfu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Write done, lock=
 again */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(&quot;Locking=
 the mtd device\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mtd_lock(mt=
d, lock_ofs, lock_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &amp;&amp; =
ret !=3D -EOPNOTSUPP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -EOP=
NOTSUPP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printf(&quot;MTD device lock failed\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000005ce7cf05bd2cc91a--

--===============1561778605324184892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1561778605324184892==--
