Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB07B19312
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Aug 2025 10:18:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED9DBC36B3E;
	Sun,  3 Aug 2025 08:18:01 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B21BC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Aug 2025 08:18:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2400f746440so26208675ad.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Aug 2025 01:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754209079; x=1754813879;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nqZJm5/+xY6P/KZPKIj2Kg3f3UVIQ93aHheucjO0DyA=;
 b=B+ZbtNJNdqUmmbcWOEhXpOnswdF+bad5cUatwO5NXu+Ku0OHaxXhLN8gJbVG6MWCZk
 SEEIT2HFAwZ+f9IkPBq6rXDIiewf249bj9i1ZnwoU4LIaERBTocjwzjcZXpqo0SiiNYx
 g+/rkxX1Ews9I8+vD258N4jNsGXVhHVEyGidU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754209079; x=1754813879;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nqZJm5/+xY6P/KZPKIj2Kg3f3UVIQ93aHheucjO0DyA=;
 b=PJopNf2yDC54pgRXBbod9UIeFe3OGCQILsHRfUDblvSJzqgFq6Fv/gXQQ60lf1kiuv
 +4mwKtf47UvK51CfW+0mEbJH0lAw3A4NWfSbKd6zLpYTEI28aO4dnXEODewydCON3mxh
 btIuG2esTTUpu5prBMFuE04FUqMXRFowGpemJLOQvFCbj4sf5smjhz16V5wZnyLISQQT
 jjcdjf7BtC85P+nG6WdRWvY6tGydQgOUJUMhPS7S4CnVZOoKEY1cEBVKMaLOGemf/rFq
 d7QSzsRmmWhs4sYuVwsktBYBOof3XE8uxBzYb/xfuy+LdEx4GFjm+qTks1pxaLhVsLQT
 bNCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPtXYmC355U4p5qPXLA6Pmaj390AEnYPZa+La+W+0tdOMcj6BcQeWc4iXrj4jIJzLaPsu8Eu2YrrAedg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXYAsXhkoSLfktBsHe6CNaivUPR8lO0fggxEP79+jJ18n3Nysh
 P6/7fxfnREX/zhsu7h3mEbous068KbYrO9N4dvwZ7U98KYkSrVFODOUl9HK+9NPo9HSerruV59s
 26v8AjL80LiPLCqfaIVLIrOWSxSy6XSSH8KuV8C7Oyw==
X-Gm-Gg: ASbGncv1N0LvVMR416/+44+QUQ4EDSkfTJuzQdovXew+8rOe9n/KmvExp/MJHMLyGl/
 5LY3NvcUtzl4QKr2ZMvji0Sc7saXJ5yHaHbDG4tl03x4gvGpjfZpLqyc4ewHzQE98Ue4c1wayy2
 EJa8nSI4fM/OdSoNtEJpGoyYdtUOJWfcNyT4s3h44bSXoEqm9AlcaTTaL6pFTZcB/hmyW3LqPaI
 r2ZeNNUF4JJsDhp
X-Google-Smtp-Source: AGHT+IG+STrTyhl92Vf2RLwaJqYusC+AP29TxV7ruyLXl9ORiMZyoYaLCqjcc4gOSW/kzfjY9+YjTU2GLepqsmewN9o=
X-Received: by 2002:a17:902:c94c:b0:242:1b:7f05 with SMTP id
 d9443c01a7336-24246ff1f80mr81605025ad.24.1754209078819; Sun, 03 Aug 2025
 01:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtd_nand_raw2-v1-0-bdabdeb35b46@linaro.org>
 <20250801-mtd_nand_raw2-v1-1-bdabdeb35b46@linaro.org>
In-Reply-To: <20250801-mtd_nand_raw2-v1-1-bdabdeb35b46@linaro.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 3 Aug 2025 10:17:43 +0200
X-Gm-Features: Ac12FXzRtoUi4QPJ7rC-HfKsiZoC8_JBTlZYa8lWlbkoPYgiItX-mDxPMcGcKb4
Message-ID: <CAOf5uwmhNsXSZFaC_fqL2FFFHJ1CmEz4Xj0D4=7cu6nKPMaNfg@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] mtd: nand: pxa3xx: Free memory on
	error
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
Content-Type: multipart/mixed; boundary="===============3234531247661850306=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3234531247661850306==
Content-Type: multipart/alternative; boundary="000000000000015947063b71a1fe"

--000000000000015947063b71a1fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 1, 2025 at 12:39=E2=80=AFPM Andrew Goodbody <andrew.goodbody@li=
naro.org>
wrote:

> In pxa3xx_nand_probe_dt if the function detects an error after
> allocating memory that memory is not freed before exit. Add the
> appropriate free.
>
> This issue was found by Smatch.
>
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
>  drivers/mtd/nand/raw/pxa3xx_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/raw/pxa3xx_nand.c
> b/drivers/mtd/nand/raw/pxa3xx_nand.c
> index b78b4e60238..7bf54fa4654 100644
> --- a/drivers/mtd/nand/raw/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/raw/pxa3xx_nand.c
> @@ -1765,6 +1765,7 @@ static int pxa3xx_nand_probe_dt(struct udevice *dev=
,
> struct pxa3xx_nand_info *in
>         pdata->num_cs =3D dev_read_u32_default(dev, "num-cs", 1);
>         if (pdata->num_cs !=3D 1) {
>                 pr_err("pxa3xx driver supports single CS only\n");
> +               kfree(pdata);
>                 return -EINVAL;
>         }
>

Reviewed-by: MIchael Trimarchi <michael@amarulasolutions.com>


>
>
> --
> 2.39.5
>
>

--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

--000000000000015947063b71a1fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 1, 2025 at 12:39=
=E2=80=AFPM Andrew Goodbody &lt;<a href=3D"mailto:andrew.goodbody@linaro.or=
g">andrew.goodbody@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">In pxa3xx_nand_probe_dt if the function detect=
s an error after<br>
allocating memory that memory is not freed before exit. Add the<br>
appropriate free.<br>
<br>
This issue was found by Smatch.<br>
<br>
Signed-off-by: Andrew Goodbody &lt;<a href=3D"mailto:andrew.goodbody@linaro=
.org" target=3D"_blank">andrew.goodbody@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/mtd/nand/raw/pxa3xx_nand.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/mtd/nand/raw/pxa3xx_nand.c b/drivers/mtd/nand/raw/pxa3=
xx_nand.c<br>
index b78b4e60238..7bf54fa4654 100644<br>
--- a/drivers/mtd/nand/raw/pxa3xx_nand.c<br>
+++ b/drivers/mtd/nand/raw/pxa3xx_nand.c<br>
@@ -1765,6 +1765,7 @@ static int pxa3xx_nand_probe_dt(struct udevice *dev, =
struct pxa3xx_nand_info *in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata-&gt;num_cs =3D dev_read_u32_default(dev, =
&quot;num-cs&quot;, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pdata-&gt;num_cs !=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;pxa3xx=
 driver supports single CS only\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pdata);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Reviewed-=
by: MIchael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.com">m=
ichael@amarulasolutions.com</a>&gt;</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Nazzareno Trimarchi<br>Co-Founder &amp; =
Chief Executive Officer<br>M. +39 347 913 2170<br><a href=3D"mailto:michael=
@amarulasolutions.com" target=3D"_blank">michael@amarulasolutions.com</a><b=
r>__________________________________<br><div><br></div><div>Amarula Solutio=
ns BV</div>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>T. +31 (0)85 111 =
9172<br><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br><a href=3D"http://www.amarulasolutions.com" ta=
rget=3D"_blank">www.amarulasolutions.com</a><br></div></div></div>

--000000000000015947063b71a1fe--

--===============3234531247661850306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3234531247661850306==--
