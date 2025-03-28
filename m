Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D3A74ED8
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 18:06:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1BB6C78F7F;
	Fri, 28 Mar 2025 17:06:23 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E420DC78F77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 17:06:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so4447345a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743181581; x=1743786381;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DVQy9pzG7MgsGKk/lOhNN8DYfOQLW28jiVe9Xr570xE=;
 b=DzFgf3mIPMybVfqVF0LZ2NWP8eZjDXlw0ySjoD0/VwffbLzC6Q2F2PFB26OMchdfso
 1VDXn65wSOLLQ4fDzhihFAxpo6k3w/OM18Rb35PlNFdPwlHW3SaY4RRW/VGl+V7m+G1p
 xQZ7lhK5a/J/EWQ9OeidpzYwH6BMfsJDhQqUnYOeESG1we309ViRHjTJKK+v2Vyvhi8T
 SsAa7zKwH/pa0NQ3vbRGOIx3tD8WY6mn/aIu9ahEvRbaYJq/X/IIvmaMyCus+8tLDGBk
 6km9ekMKaehDQSYIW0Qv1rK9Wav1IAs8/1maZdFLryL4Qb0fK3Zcz2neFX7izHO46vz4
 4vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743181581; x=1743786381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVQy9pzG7MgsGKk/lOhNN8DYfOQLW28jiVe9Xr570xE=;
 b=gLBFL74qnwXm1K9gEBdGFgpzpEY49EhaUoafVE6+bB/WFsiJJ5WomD7rU9kKOEDIJG
 vXIKMsd3wcrePhpyWrAMyVEJldiBiy0NlHHyZJoeTBe5/2BqsXEO090YANEnzieVDluo
 vwP15t94Keq7aMk5K4SG4hNDDQyJpOZtW/746YmlWshonXinEFK0onHpPS4BibdpqvfE
 BcUd7P4ANo4ztZX7AIca9CdQNGEaAkvBHqaaTc/ES3SSOiV1NIAfaSVbPEczeMQ2Siva
 bDojgqW9YVkQ2k5tDdqKugySZSQYKUJPDben8FWEjOcByFIUpBaOradMUcSfgvUFaIN+
 kuBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Unu/+s317pFtDwwAhRxGiL3MP6CTPINUJkDMaaenAoaVh58i4mWuVX1S8wh44C53X2dHfdcg7rJ/Ug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxSo+FQ+NHsAlWOxp/xLbqmi1uK+HZlkhpMcyd1ycNuNDCvWFPY
 T4fwWwFhXiP8lTrIishdcD2nl9876BQc3b8TbQpghNIO2GcVe4AgbpdzpsfHpH/4ESm2zn2LZJg
 hvNKRkqApzNRklIM6E8hew4DsDBs=
X-Gm-Gg: ASbGncvNICv7WVpH+K7CNgGBEz3+PpyrS63t9L4DleZBFGnScbUkdP1n5EQV3yAeHPf
 WG80RhMTnmLy2UQwmQbYr6yqWPPwHGSXXZOQaC9oBCXM7pZgaMkmt35Gc15e9k1mbFkyUm2CJHS
 vEZAXckIZNOYZSqXq4RnuUgrHuxg==
X-Google-Smtp-Source: AGHT+IEHMNOlMHIWrBKHNdmvityZ+xlj0PMM3dhZ2zrlpSy82ADt+05NYINIb5EoW/Gh4VIGoUfw4f/Jg1YEHrU/YTY=
X-Received: by 2002:a05:6402:280f:b0:5e5:bbd5:676a with SMTP id
 4fb4d7f45d1cf-5ed8f3fd169mr7363173a12.22.1743181580940; Fri, 28 Mar 2025
 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250328163115.642347-1-patrice.chotard@foss.st.com>
In-Reply-To: <20250328163115.642347-1-patrice.chotard@foss.st.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 28 Mar 2025 17:06:09 +0000
X-Gm-Features: AQ5f1JoX5fVF-zQpNe1IjgBk7NDeEAgxpT8SXnHkO36KBEJZIMnqQUnwiOXHvss
Message-ID: <CALeDE9NHP6J97A0Zy13TDB66cpcJutT0DYvU=Ts6G4aBN+RwVg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] dtc: introduce label relative path
	references
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
Content-Type: multipart/mixed; boundary="===============0046221369397777130=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0046221369397777130==
Content-Type: multipart/alternative; boundary="000000000000e9428806316a165c"

--000000000000e9428806316a165c
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 16:52, Patrice Chotard <patrice.chotard@foss.st.com>
wrote:

> Since introduction of OF_UPSTREAM flag, U-Boot's dtc must be able
> to compile Kernel's device tree.
>
> Since kernel commit 7de129f5389b ("ARM: dts: stm32: stm32mp151a-prtt1l:
> Fix QSPI configuration"), label relative path references has been
> introduced. These label relative path references is not supported
> by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).
>
> In order to support such label relative patch references
> adds following commit from upstream DTC tree:
>

Maybe we need to rebase to the latest upstream dtc, I'm not sure pulling in
a random set of bits from upstream is the right way to do things as it's
brings things selectively which may bring along other issues.


> commit 651410e54cb9 ("util: introduce xstrndup helper")
> commit ec7986e682cf ("dtc: introduce label relative path references")
>
> [1] https://lore.kernel.org/all/20250115144428.GZ3476@bill-the-cat/T/
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Simon Glass <sjg@chromium.org>
> ---
>
>  scripts/dtc/dtc-lexer.l  |  2 +-
>  scripts/dtc/dtc-parser.y | 13 +++++++++++++
>  scripts/dtc/livetree.c   | 33 ++++++++++++++++++++++++++++++---
>  scripts/dtc/util.c       | 11 +++++++++++
>  scripts/dtc/util.h       |  1 +
>  5 files changed, 56 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
> index d3694d6cf20..d34e1b04220 100644
> --- a/scripts/dtc/dtc-lexer.l
> +++ b/scripts/dtc/dtc-lexer.l
> @@ -215,7 +215,7 @@ static void PRINTF(1, 2) lexical_error(const char
> *fmt, ...);
>                         return DT_REF;
>                 }
>
> -<*>"&{/"{PATHCHAR}*\}  {       /* new-style path reference */
> +<*>"&{"{PATHCHAR}*\}   {       /* new-style path reference */
>                         yytext[yyleng-1] = '\0';
>                         DPRINT("Ref: %s\n", yytext+2);
>                         yylval.labelref = xstrdup(yytext+2);
> diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
> index 011a5b25539..b3b9c83873d 100644
> --- a/scripts/dtc/dtc-parser.y
> +++ b/scripts/dtc/dtc-parser.y
> @@ -34,6 +34,12 @@ extern void yyerror(char const *s);
>
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
> +
> +static bool is_ref_relative(const char *ref)
> +{
> +       return ref[0] != '/' && strchr(&ref[1], '/');
> +}
> +
>  %}
>
>  %union {
> @@ -176,12 +182,17 @@ devicetree:
>                          */
>                         if (!($<flags>-1 & DTSF_PLUGIN))
>                                 ERROR(&@2, "Label or path %s not found",
> $1);
> +                       else if (is_ref_relative($1))
> +                               ERROR(&@2, "Label-relative reference %s
> not supported in plugin", $1);
>                         $$ = add_orphan_node(name_node(build_node(NULL,
> NULL), ""), $2, $1);
>                 }
>         | devicetree DT_LABEL DT_REF nodedef
>                 {
>                         struct node *target = get_node_by_ref($1, $3);
>
> +                       if (($<flags>-1 & DTSF_PLUGIN) &&
> is_ref_relative($3))
> +                               ERROR(&@2, "Label-relative reference %s
> not supported in plugin", $3);
> +
>                         if (target) {
>                                 add_label(&target->labels, $2);
>                                 merge_nodes(target, $4);
> @@ -197,6 +208,8 @@ devicetree:
>                          * so $-1 is what we want (plugindecl)
>                          */
>                         if ($<flags>-1 & DTSF_PLUGIN) {
> +                               if (is_ref_relative($2))
> +                                       ERROR(&@2, "Label-relative
> reference %s not supported in plugin", $2);
>                                 add_orphan_node($1, $3, $2);
>                         } else {
>                                 struct node *target = get_node_by_ref($1,
> $2);
> diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
> index ba06ef348be..4cfc2adccdd 100644
> --- a/scripts/dtc/livetree.c
> +++ b/scripts/dtc/livetree.c
> @@ -583,12 +583,39 @@ struct node *get_node_by_phandle(struct node *tree,
> cell_t phandle)
>
>  struct node *get_node_by_ref(struct node *tree, const char *ref)
>  {
> +       struct node *target = tree;
> +       const char *label = NULL, *path = NULL;
> +
>         if (streq(ref, "/"))
>                 return tree;
> -       else if (ref[0] == '/')
> -               return get_node_by_path(tree, ref);
> +
> +       if (ref[0] == '/')
> +               path = ref;
>         else
> -               return get_node_by_label(tree, ref);
> +               label = ref;
> +
> +       if (label) {
> +               const char *slash = strchr(label, '/');
> +               char *buf = NULL;
> +
> +               if (slash) {
> +                       buf = xstrndup(label, slash - label);
> +                       label = buf;
> +                       path = slash + 1;
> +               }
> +
> +               target = get_node_by_label(tree, label);
> +
> +               free(buf);
> +
> +               if (!target)
> +                       return NULL;
> +       }
> +
> +       if (path)
> +               target = get_node_by_path(target, path);
> +
> +       return target;
>  }
>
>  cell_t get_node_phandle(struct node *root, struct node *node)
> diff --git a/scripts/dtc/util.c b/scripts/dtc/util.c
> index 23334d39bb6..25d4db1e8c2 100644
> --- a/scripts/dtc/util.c
> +++ b/scripts/dtc/util.c
> @@ -46,6 +46,17 @@ char *xstrdup(const char *s)
>         return d;
>  }
>
> +char *xstrndup(const char *s, size_t n)
> +{
> +       size_t len = strnlen(s, n) + 1;
> +       char *d = xmalloc(len);
> +
> +       memcpy(d, s, len - 1);
> +       d[len - 1] = '\0';
> +
> +       return d;
> +}
> +
>  /* based in part from (3) vsnprintf */
>  int xasprintf(char **strp, const char *fmt, ...)
>  {
> diff --git a/scripts/dtc/util.h b/scripts/dtc/util.h
> index 211d584435d..23e32962385 100644
> --- a/scripts/dtc/util.h
> +++ b/scripts/dtc/util.h
> @@ -70,6 +70,7 @@ static inline void *xrealloc(void *p, size_t len)
>  }
>
>  extern char *xstrdup(const char *s);
> +extern char *xstrndup(const char *s, size_t len);
>
>  extern int PRINTF(2, 3) xasprintf(char **strp, const char *fmt, ...);
>  extern char *join_path(const char *path, const char *name);
> --
> 2.25.1
>
>

--000000000000e9428806316a165c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 Mar =
2025 at 16:52, Patrice Chotard &lt;<a href=3D"mailto:patrice.chotard@foss.s=
t.com">patrice.chotard@foss.st.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Since introduction of OF_UPSTREAM flag, U=
-Boot&#39;s dtc must be able<br>
to compile Kernel&#39;s device tree.<br>
<br>
Since kernel commit 7de129f5389b (&quot;ARM: dts: stm32: stm32mp151a-prtt1l=
:<br>
Fix QSPI configuration&quot;), label relative path references has been<br>
introduced. These label relative path references is not supported<br>
by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).<br>
<br>
In order to support such label relative patch references<br>
adds following commit from upstream DTC tree:<br></blockquote><div><br></di=
v><div>Maybe we need to rebase to the latest upstream dtc, I&#39;m not sure=
 pulling in a random set of bits from upstream is the right way to do thing=
s as it&#39;s brings things selectively which may bring along other issues.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
commit 651410e54cb9 (&quot;util: introduce xstrndup helper&quot;)<br>
commit ec7986e682cf (&quot;dtc: introduce label relative path references&qu=
ot;)<br>
<br>
[1] <a href=3D"https://lore.kernel.org/all/20250115144428.GZ3476@bill-the-c=
at/T/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/202=
50115144428.GZ3476@bill-the-cat/T/</a><br>
<br>
Signed-off-by: Patrice Chotard &lt;<a href=3D"mailto:patrice.chotard@foss.s=
t.com" target=3D"_blank">patrice.chotard@foss.st.com</a>&gt;<br>
Cc: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">tr=
ini@konsulko.com</a>&gt;<br>
Cc: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">s=
jg@chromium.org</a>&gt;<br>
---<br>
<br>
=C2=A0scripts/dtc/dtc-lexer.l=C2=A0 |=C2=A0 2 +-<br>
=C2=A0scripts/dtc/dtc-parser.y | 13 +++++++++++++<br>
=C2=A0scripts/dtc/livetree.c=C2=A0 =C2=A0| 33 +++++++++++++++++++++++++++++=
+---<br>
=C2=A0scripts/dtc/util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++++++<br>
=C2=A0scripts/dtc/util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A05 files changed, 56 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l<br>
index d3694d6cf20..d34e1b04220 100644<br>
--- a/scripts/dtc/dtc-lexer.l<br>
+++ b/scripts/dtc/dtc-lexer.l<br>
@@ -215,7 +215,7 @@ static void PRINTF(1, 2) lexical_error(const char *fmt,=
 ...);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return DT_REF;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-&lt;*&gt;&quot;&amp;{/&quot;{PATHCHAR}*\}=C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* new-style path reference */<br>
+&lt;*&gt;&quot;&amp;{&quot;{PATHCHAR}*\}=C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* new-style path reference */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yytext[yyleng-1] =3D &#39;\0&#39;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DPRINT(&quot;Ref: %s\n&quot;, yytext+2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 yylval.labelref =3D xstrdup(yytext+2);<br>
diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y<br>
index 011a5b25539..b3b9c83873d 100644<br>
--- a/scripts/dtc/dtc-parser.y<br>
+++ b/scripts/dtc/dtc-parser.y<br>
@@ -34,6 +34,12 @@ extern void yyerror(char const *s);<br>
<br>
=C2=A0extern struct dt_info *parser_output;<br>
=C2=A0extern bool treesource_error;<br>
+<br>
+static bool is_ref_relative(const char *ref)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ref[0] !=3D &#39;/&#39; &amp;&amp; strch=
r(&amp;ref[1], &#39;/&#39;);<br>
+}<br>
+<br>
=C2=A0%}<br>
<br>
=C2=A0%union {<br>
@@ -176,12 +182,17 @@ devicetree:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!($&lt;flags&gt;-1 &amp; DTSF_PLUGIN))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR(&amp;@2, &quot;Label or path %=
s not found&quot;, $1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else if (is_ref_relative($1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR(&amp;@2, &quot;Label-relative r=
eference %s not supported in plugin&quot;, $1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $$ =3D add_orphan_node(name_node(build_node(NULL, NULL), &quot;&=
quot;), $2, $1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | devicetree DT_LABEL DT_REF nodedef<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct node *target =3D get_node_by_ref($1, $3);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (($&lt;flags&gt;-1 &amp; DTSF_PLUGIN) &amp;&amp; is_ref_relati=
ve($3))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR(&amp;@2, &quot;Label-relative r=
eference %s not supported in plugin&quot;, $3);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_label(&amp;target-&gt;labels, $2=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 merge_nodes(target, $4);<br>
@@ -197,6 +208,8 @@ devicetree:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* so $-1 is what we want (plugindecl)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ($&lt;flags&gt;-1 &amp; DTSF_PLUGIN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_ref_relative($2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR(&am=
p;@2, &quot;Label-relative reference %s not supported in plugin&quot;, $2);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_orphan_node($1, $3, $2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct node *target =3D get_node_by_=
ref($1, $2);<br>
diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c<br>
index ba06ef348be..4cfc2adccdd 100644<br>
--- a/scripts/dtc/livetree.c<br>
+++ b/scripts/dtc/livetree.c<br>
@@ -583,12 +583,39 @@ struct node *get_node_by_phandle(struct node *tree, c=
ell_t phandle)<br>
<br>
=C2=A0struct node *get_node_by_ref(struct node *tree, const char *ref)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct node *target =3D tree;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *label =3D NULL, *path =3D NULL;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(ref, &quot;/&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return tree;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ref[0] =3D=3D &#39;/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return get_node_by_=
path(tree, ref);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ref[0] =3D=3D &#39;/&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D ref;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return get_node_by_=
label(tree, ref);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D ref;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (label) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *slash =
=3D strchr(label, &#39;/&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf =3D NULL;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (slash) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0buf =3D xstrndup(label, slash - label);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0label =3D buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0path =3D slash + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target =3D get_node=
_by_label(tree, label);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target =3D get_node=
_by_path(target, path);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return target;<br>
=C2=A0}<br>
<br>
=C2=A0cell_t get_node_phandle(struct node *root, struct node *node)<br>
diff --git a/scripts/dtc/util.c b/scripts/dtc/util.c<br>
index 23334d39bb6..25d4db1e8c2 100644<br>
--- a/scripts/dtc/util.c<br>
+++ b/scripts/dtc/util.c<br>
@@ -46,6 +46,17 @@ char *xstrdup(const char *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d;<br>
=C2=A0}<br>
<br>
+char *xstrndup(const char *s, size_t n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len =3D strnlen(s, n) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *d =3D xmalloc(len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(d, s, len - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0d[len - 1] =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return d;<br>
+}<br>
+<br>
=C2=A0/* based in part from (3) vsnprintf */<br>
=C2=A0int xasprintf(char **strp, const char *fmt, ...)<br>
=C2=A0{<br>
diff --git a/scripts/dtc/util.h b/scripts/dtc/util.h<br>
index 211d584435d..23e32962385 100644<br>
--- a/scripts/dtc/util.h<br>
+++ b/scripts/dtc/util.h<br>
@@ -70,6 +70,7 @@ static inline void *xrealloc(void *p, size_t len)<br>
=C2=A0}<br>
<br>
=C2=A0extern char *xstrdup(const char *s);<br>
+extern char *xstrndup(const char *s, size_t len);<br>
<br>
=C2=A0extern int PRINTF(2, 3) xasprintf(char **strp, const char *fmt, ...);=
<br>
=C2=A0extern char *join_path(const char *path, const char *name);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e9428806316a165c--

--===============0046221369397777130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0046221369397777130==--
