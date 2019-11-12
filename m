Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE2F8D0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 11:41:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01001C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:41:00 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F25A0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 10:40:59 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v8so17214403ljh.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v46d+qB8DzdTJA1PTUjoL9AW1iIWq6gvPcK5Jr4R4yY=;
 b=OUFsKmJ6HFTN0yWjgi+datbmUFMiWWDQ/YL3csfVTM1KWDTDhWg15Ax2HuPAFbmt4Y
 9wAl5YadDbiaF4GwdWFZo5gr5JefRzljkUy5fumvw+oyQS3P9JeVRQVSPvZtr51cGHP7
 ivd0/Ob81TJaHZwz1pn71myb3vBiL7xqYqzhTaf9T7bPV8TiXhYvbRpFoudu3qXDgsoc
 YrfK8cTIuouvjE/yHOYLAZOqpaxb10pw6Y56gzzzcXDo7A+XOZozHCFc+Tqw9WqzGuA2
 lv3axu1Xbdo6EIopFxQTw4tpjMVyGKeBVgrHv6qSNK8VzTokt8vl5REUIz9IslnKdo5K
 7dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v46d+qB8DzdTJA1PTUjoL9AW1iIWq6gvPcK5Jr4R4yY=;
 b=TDe/cUWUntK49h+RHEm1q3lyyxTLN00yH+lYw7UREcDfQvHtVyFjIQsOshuCoVaqAk
 aNh6cbeeTK8Z/saxEvpBleS56TKSR3XxOvxsGoFnKnVhwoQRNYi4pARMHZmrWN0oXso/
 VDsm7uykaXJLc2FosutudRaYqYzufwSWGD09crOe4fHFA7Wzg1gkSgvFNhEVJHvWbZ3b
 C3WU0UdvBjiqP1HiItoym2a3NhHH3ejaJoMsTiV9dijn6d9I+szhc9283NGaPaPRJbge
 9yTus2P+zXtci74RrfRgpDKlgdpUEgYDARFdKt4vLzKNOeKD733hcuuuwcuKhTuMZA1Z
 K42w==
X-Gm-Message-State: APjAAAX2g+SqheJNNk91uqBHRRejDTcXqL2EbkCrmXlyoy7GTtpYGuDO
 rVZnVk0aA7Kiib/Q6+1loAwXty4NWK3oPgnokd0=
X-Google-Smtp-Source: APXvYqyThWNWICQGcX3gTEu9x6YjOAGGqq2b4bYW2K00mqtVgu/PKODxG4dZOZ91FCqRhmE4f934CxpdIpNlrRJsk08=
X-Received: by 2002:a2e:9a8b:: with SMTP id p11mr10502223lji.164.1573555259066; 
 Tue, 12 Nov 2019 02:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20191112094214.12686-1-patrick.delaunay@st.com>
 <20191112094214.12686-2-patrick.delaunay@st.com>
In-Reply-To: <20191112094214.12686-2-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Date: Tue, 12 Nov 2019 11:40:46 +0100
Message-ID: <CAAh8qsyBv4i+mbMMNe5c3Nu-wjY=+EhO6xQ5Ukpcr3rziNUuWQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Sekhar Nori <nsekhar@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 b.galvani@gmail.com, U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/5] dm: clk: add stub for
 clk_disable_bulk when CONFIG_CLK is desactivated
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
Content-Type: multipart/mixed; boundary="===============2319377611501396957=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2319377611501396957==
Content-Type: multipart/alternative; boundary="000000000000404d4f059723e2ac"

--000000000000404d4f059723e2ac
Content-Type: text/plain; charset="UTF-8"

Patrick Delaunay <patrick.delaunay@st.com> schrieb am Di., 12. Nov. 2019,
10:42:

> Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated.
>
> That avoid compilation issue (undefined reference to
> `clk_disable_bulk') for code:
>
> clk_disable_bulk(&priv->clks);
> clk_release_bulk(&priv->clks);
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - Add stub for clk_disable_bulk
>
> Changes in v2: None
>
>  include/clk.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/clk.h b/include/clk.h
> index a5ee53d94a..6f0b0fe4bc 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);
>   *             by clk_get_bulk().
>   * @return zero on success, or -ve error code.
>   */
> + #if CONFIG_IS_ENABLED(CLK)
>  int clk_disable_bulk(struct clk_bulk *bulk);
> +#else
> +inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }
> +#endif
>

Doing this inline at this place seems quite different than what is done for
the other functions?

Regards,
Simon


>  /**
>   * clk_is_match - check if two clk's point to the same hardware clock
> --
> 2.17.1
>
>

--000000000000404d4f059723e2ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Patrick Delaunay &lt;<a href=3D"mailto:patrick.delauna=
y@st.com">patrick.delaunay@st.com</a>&gt; schrieb am Di., 12. Nov. 2019, 10=
:42:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Add stub for clk_disable_bulk(=
) when CONFIG_CLK is desactivated.<br>
<br>
That avoid compilation issue (undefined reference to<br>
`clk_disable_bulk&#39;) for code:<br>
<br>
clk_disable_bulk(&amp;priv-&gt;clks);<br>
clk_release_bulk(&amp;priv-&gt;clks);<br>
<br>
Signed-off-by: Patrick Delaunay &lt;<a href=3D"mailto:patrick.delaunay@st.c=
om" target=3D"_blank" rel=3D"noreferrer">patrick.delaunay@st.com</a>&gt;<br=
>
---<br>
<br>
Changes in v3:<br>
- Add stub for clk_disable_bulk<br>
<br>
Changes in v2: None<br>
<br>
=C2=A0include/clk.h | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/include/clk.h b/include/clk.h<br>
index a5ee53d94a..6f0b0fe4bc 100644<br>
--- a/include/clk.h<br>
+++ b/include/clk.h<br>
@@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by clk_get_bulk().<=
br>
=C2=A0 * @return zero on success, or -ve error code.<br>
=C2=A0 */<br>
+ #if CONFIG_IS_ENABLED(CLK)<br>
=C2=A0int clk_disable_bulk(struct clk_bulk *bulk);<br>
+#else<br>
+inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }<br>
+#endif<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Doing this inline at this place seems quite different than what is d=
one for the other functions?</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Regards,</div><div dir=3D"auto">Simon</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
=C2=A0/**<br>
=C2=A0 * clk_is_match - check if two clk&#39;s point to the same hardware c=
lock<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div></div>

--000000000000404d4f059723e2ac--

--===============2319377611501396957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2319377611501396957==--
