Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82AA74F75
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Mar 2025 18:35:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDC2BC78F7F;
	Fri, 28 Mar 2025 17:35:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC33C78F75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 17:35:25 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SEaBWe025573;
 Fri, 28 Mar 2025 18:35:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3PDLNtO7fQqsdkjTSVToN/mpGvGpEau6CQzu5k5zU9k=; b=JkVC0bu6ZdnMRRiu
 1VC8qRQCSbjkJYDhzhuKFALau/483KbQLufZMXZker1iZWXvyr/N8oLkTK1l2eg7
 DB2e583lN/U7l1igWvSDv4Tn5pafLfBcM3clqeqIY5IcgE4nBC3+WCPixfb6xjQ5
 sApI/kmUuwRn8eA8Y6v6ZsNft01IdAnMhxApzy4M11tuXMENepN/4h8xFfUe2TvZ
 G1Nv5hqGZPTa3MpetJXb9iiWcdAVgZvk0A1U3xWDy4svQQK460so7vLM35g+1q4z
 wZgqVwb0wMvXLzKmPjGMWQC3zfxSm0nmp+tYn61NIXZmALMUL2AaiMPVtDvZdaOQ
 xIAk3Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45nq16tngy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 18:35:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EE9CE40064;
 Fri, 28 Mar 2025 18:34:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E49C893CC5C;
 Fri, 28 Mar 2025 18:21:23 +0100 (CET)
Received: from [10.252.14.194] (10.252.14.194) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 18:21:23 +0100
Message-ID: <355ebc65-18fc-4b1a-b1e0-a1d0d7b5e9cf@foss.st.com>
Date: Fri, 28 Mar 2025 18:21:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Robinson <pbrobinson@gmail.com>
References: <20250328163115.642347-1-patrice.chotard@foss.st.com>
 <CALeDE9NHP6J97A0Zy13TDB66cpcJutT0DYvU=Ts6G4aBN+RwVg@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CALeDE9NHP6J97A0Zy13TDB66cpcJutT0DYvU=Ts6G4aBN+RwVg@mail.gmail.com>
X-Originating-IP: [10.252.14.194]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 3/28/25 18:06, Peter Robinson wrote:
> On Fri, 28 Mar 2025 at 16:52, Patrice Chotard <patrice.chotard@foss.st.com>
> wrote:
> 
>> Since introduction of OF_UPSTREAM flag, U-Boot's dtc must be able
>> to compile Kernel's device tree.
>>
>> Since kernel commit 7de129f5389b ("ARM: dts: stm32: stm32mp151a-prtt1l:
>> Fix QSPI configuration"), label relative path references has been
>> introduced. These label relative path references is not supported
>> by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).
>>
>> In order to support such label relative patch references
>> adds following commit from upstream DTC tree:
>>
> 
> Maybe we need to rebase to the latest upstream dtc, I'm not sure pulling in
> a random set of bits from upstream is the right way to do things as it's
> brings things selectively which may bring along other issues.

Hi Peter

Initially it was expected to migrate to dtc 1.7.1 as proposed by Tom, 
but as explained here [1] it has huge impacts on several U-Boot components
mainly due to DT header alignment on 8 bytes (even if some DT check can 
be bypassed using FDT_ASSUME_MASK, i am not sure it's a good option).

I have spent time to investigate some issue raised by U-Boot CI-Build and 
it's a huge time consuming task, more than expected.

Thanks
Patrice

> 
> 
>> commit 651410e54cb9 ("util: introduce xstrndup helper")
>> commit ec7986e682cf ("dtc: introduce label relative path references")
>>
>> [1] https://lore.kernel.org/all/20250115144428.GZ3476@bill-the-cat/T/
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> ---
>>
>>  scripts/dtc/dtc-lexer.l  |  2 +-
>>  scripts/dtc/dtc-parser.y | 13 +++++++++++++
>>  scripts/dtc/livetree.c   | 33 ++++++++++++++++++++++++++++++---
>>  scripts/dtc/util.c       | 11 +++++++++++
>>  scripts/dtc/util.h       |  1 +
>>  5 files changed, 56 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
>> index d3694d6cf20..d34e1b04220 100644
>> --- a/scripts/dtc/dtc-lexer.l
>> +++ b/scripts/dtc/dtc-lexer.l
>> @@ -215,7 +215,7 @@ static void PRINTF(1, 2) lexical_error(const char
>> *fmt, ...);
>>                         return DT_REF;
>>                 }
>>
>> -<*>"&{/"{PATHCHAR}*\}  {       /* new-style path reference */
>> +<*>"&{"{PATHCHAR}*\}   {       /* new-style path reference */
>>                         yytext[yyleng-1] = '\0';
>>                         DPRINT("Ref: %s\n", yytext+2);
>>                         yylval.labelref = xstrdup(yytext+2);
>> diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
>> index 011a5b25539..b3b9c83873d 100644
>> --- a/scripts/dtc/dtc-parser.y
>> +++ b/scripts/dtc/dtc-parser.y
>> @@ -34,6 +34,12 @@ extern void yyerror(char const *s);
>>
>>  extern struct dt_info *parser_output;
>>  extern bool treesource_error;
>> +
>> +static bool is_ref_relative(const char *ref)
>> +{
>> +       return ref[0] != '/' && strchr(&ref[1], '/');
>> +}
>> +
>>  %}
>>
>>  %union {
>> @@ -176,12 +182,17 @@ devicetree:
>>                          */
>>                         if (!($<flags>-1 & DTSF_PLUGIN))
>>                                 ERROR(&@2, "Label or path %s not found",
>> $1);
>> +                       else if (is_ref_relative($1))
>> +                               ERROR(&@2, "Label-relative reference %s
>> not supported in plugin", $1);
>>                         $$ = add_orphan_node(name_node(build_node(NULL,
>> NULL), ""), $2, $1);
>>                 }
>>         | devicetree DT_LABEL DT_REF nodedef
>>                 {
>>                         struct node *target = get_node_by_ref($1, $3);
>>
>> +                       if (($<flags>-1 & DTSF_PLUGIN) &&
>> is_ref_relative($3))
>> +                               ERROR(&@2, "Label-relative reference %s
>> not supported in plugin", $3);
>> +
>>                         if (target) {
>>                                 add_label(&target->labels, $2);
>>                                 merge_nodes(target, $4);
>> @@ -197,6 +208,8 @@ devicetree:
>>                          * so $-1 is what we want (plugindecl)
>>                          */
>>                         if ($<flags>-1 & DTSF_PLUGIN) {
>> +                               if (is_ref_relative($2))
>> +                                       ERROR(&@2, "Label-relative
>> reference %s not supported in plugin", $2);
>>                                 add_orphan_node($1, $3, $2);
>>                         } else {
>>                                 struct node *target = get_node_by_ref($1,
>> $2);
>> diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
>> index ba06ef348be..4cfc2adccdd 100644
>> --- a/scripts/dtc/livetree.c
>> +++ b/scripts/dtc/livetree.c
>> @@ -583,12 +583,39 @@ struct node *get_node_by_phandle(struct node *tree,
>> cell_t phandle)
>>
>>  struct node *get_node_by_ref(struct node *tree, const char *ref)
>>  {
>> +       struct node *target = tree;
>> +       const char *label = NULL, *path = NULL;
>> +
>>         if (streq(ref, "/"))
>>                 return tree;
>> -       else if (ref[0] == '/')
>> -               return get_node_by_path(tree, ref);
>> +
>> +       if (ref[0] == '/')
>> +               path = ref;
>>         else
>> -               return get_node_by_label(tree, ref);
>> +               label = ref;
>> +
>> +       if (label) {
>> +               const char *slash = strchr(label, '/');
>> +               char *buf = NULL;
>> +
>> +               if (slash) {
>> +                       buf = xstrndup(label, slash - label);
>> +                       label = buf;
>> +                       path = slash + 1;
>> +               }
>> +
>> +               target = get_node_by_label(tree, label);
>> +
>> +               free(buf);
>> +
>> +               if (!target)
>> +                       return NULL;
>> +       }
>> +
>> +       if (path)
>> +               target = get_node_by_path(target, path);
>> +
>> +       return target;
>>  }
>>
>>  cell_t get_node_phandle(struct node *root, struct node *node)
>> diff --git a/scripts/dtc/util.c b/scripts/dtc/util.c
>> index 23334d39bb6..25d4db1e8c2 100644
>> --- a/scripts/dtc/util.c
>> +++ b/scripts/dtc/util.c
>> @@ -46,6 +46,17 @@ char *xstrdup(const char *s)
>>         return d;
>>  }
>>
>> +char *xstrndup(const char *s, size_t n)
>> +{
>> +       size_t len = strnlen(s, n) + 1;
>> +       char *d = xmalloc(len);
>> +
>> +       memcpy(d, s, len - 1);
>> +       d[len - 1] = '\0';
>> +
>> +       return d;
>> +}
>> +
>>  /* based in part from (3) vsnprintf */
>>  int xasprintf(char **strp, const char *fmt, ...)
>>  {
>> diff --git a/scripts/dtc/util.h b/scripts/dtc/util.h
>> index 211d584435d..23e32962385 100644
>> --- a/scripts/dtc/util.h
>> +++ b/scripts/dtc/util.h
>> @@ -70,6 +70,7 @@ static inline void *xrealloc(void *p, size_t len)
>>  }
>>
>>  extern char *xstrdup(const char *s);
>> +extern char *xstrndup(const char *s, size_t len);
>>
>>  extern int PRINTF(2, 3) xasprintf(char **strp, const char *fmt, ...);
>>  extern char *join_path(const char *path, const char *name);
>> --
>> 2.25.1
>>
>>
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
