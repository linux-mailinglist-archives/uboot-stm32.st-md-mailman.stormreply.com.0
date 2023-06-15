Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4562731351
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jun 2023 11:14:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E714C65E4F;
	Thu, 15 Jun 2023 09:14:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D889C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 09:14:45 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-982a0232bdcso78243466b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686820485; x=1689412485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FpyPbZ6D+nP6wwL07PsezWZ7m+AcoLYBOfdSRkiogkI=;
 b=Mz6ak6b6y/R78RuKC0zl+vWMKHslParpFrNEVLH6e0LR/WTcIaOXQtGE316Z4e5ICN
 GKjX8NGoSmWYdgtxJaBRgjLlSoEqs5Grqj3U/jU4AB0PoBO06TfjfcLyk3TjLslGWgjO
 DtHLYfD6+th60dDcyD0xEqZ3YNswsgY6+bdj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686820485; x=1689412485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FpyPbZ6D+nP6wwL07PsezWZ7m+AcoLYBOfdSRkiogkI=;
 b=R8tnfHE/oeYYXiUuU6PZ8fUPPj4uXO2ga82E+UEkWioiyV4bl+vDI8oZpM0qRx/oz+
 cbIexnHcb9pTerU7gyL1QxQ/bThbuHqrPTAkzw2CSnLs4aCnBo6FKHveOCHqNbUoJSdF
 U5A0/CoETfHpWnBxuQwq48SMU12m16bzCQLUeIBTZIuw1Tlz3GGtAk1HsH3vtTYqhHYT
 erfCAuFgJ6haf0iT3ATjFpkrMVBfWJnftgRtyVohT6xwAmlRziNvo/0Qwf4VmjGe/U/Y
 TZx7EZV8+UZp2IX5nnMSm8VkDKawlBJ01k0nyxFOZFk4j/7Jg5Y3bqXXHbpBQgoKO4i5
 Eh6Q==
X-Gm-Message-State: AC+VfDy3x7kK2AKzrCWvo/4IPk/usTsUXNnHaOzLPMY2r8szCUppRS3E
 x98QH/A+EUZ0cuBYSDTrJUNtIJXMBGp5UPAXnLgzqw==
X-Google-Smtp-Source: ACHHUZ4Kna8Hjp7FF9GUVvplEXKAZq1ER9ScrQCRVKEuN7EDyUokRVVsTxMRpJHnEAhkvRGkwSslZPXQPu6hNlJrx4E=
X-Received: by 2002:a17:906:dc90:b0:969:faf3:7dba with SMTP id
 cs16-20020a170906dc9000b00969faf37dbamr19254380ejc.52.1686820484794; Thu, 15
 Jun 2023 02:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.2.Idd521a274f1b0524963a501324a1702a5a8b52c1@changeid>
In-Reply-To: <20230608171614.2.Idd521a274f1b0524963a501324a1702a5a8b52c1@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 15 Jun 2023 10:14:31 +0100
Message-ID: <CAPnjgZ1vm3ftxwHihksrxR78+8x=-tKBsLbVAZ0riPgEWLESSw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 02/12] fdt_support: add
	fdt_copy_fixed_partitions function
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

Hi Patrick,

On Thu, 8 Jun 2023 at 16:16, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a new function fdt_copy_fixed_partitions to copy the fixed
> partition nodes from U-Boot device tree to Linux kernel
> device tree and to dynamically configure the MTD partitions.
>
> This function fdt_copy_fixed_partitions is only based on device tree
> with livetree compatible function and replace the function
> fdt_fixup_mtdparts based on mtdparts variable.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  common/fdt_support.c  | 73 +++++++++++++++++++++++++++++++++++++++++++
>  include/fdt_support.h |  8 +++++
>  2 files changed, 81 insertions(+)
>
> diff --git a/common/fdt_support.c b/common/fdt_support.c
> index ffc59fd8b36a..5e49078f8c35 100644
> --- a/common/fdt_support.c
> +++ b/common/fdt_support.c
> @@ -1051,6 +1051,79 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
>  }
>  #endif
>
> +int fdt_copy_fixed_partitions(void *blob)
> +{
> +       ofnode node, subnode;
> +       int off, suboff, res;
> +       char path[256];
> +       int address_cells, size_cells;
> +       u8 i, j, child_count;
> +
> +       node = ofnode_by_compatible(ofnode_null(), "fixed-partitions");
> +       while (ofnode_valid(node)) {
> +               /* copy the U-Boot fixed partition */
> +               address_cells = ofnode_read_simple_addr_cells(node);
> +               size_cells = ofnode_read_simple_size_cells(node);
> +
> +               res = ofnode_get_path(ofnode_get_parent(node), path, sizeof(path));
> +               if (res)
> +                       return res;
> +
> +               off = fdt_path_offset(blob, path);
> +               if (off < 0)
> +                       return -ENODEV;

It should be possible to use livetree to write to the blob. E.g.:

oftree tree = oftree_from_fdt(blob);
ofnode node = oftree_path(tree, "/...");

That would be more future-proof than using this API. I'd like to move
DT fixup to the ofnode API eventually.

> +
> +               off = fdt_find_or_add_subnode(blob, off, "partitions");
> +               res = fdt_setprop_string(blob, off, "compatible", "fixed-partitions");
> +               if (res)
> +                       return res;
> +
> +               res = fdt_setprop_u32(blob, off, "#address-cells", address_cells);
> +               if (res)
> +                       return res;
> +
> +               res = fdt_setprop_u32(blob, off, "#size-cells", size_cells);
> +               if (res)
> +                       return res;
> +
> +               /*
> +                * parse partition in reverse order as fdt_find_or_add_subnode() only
> +                * insert the new node after the parent's properties
> +                */
> +               child_count = ofnode_get_child_count(node);
> +               for (i = child_count; i > 0 ; i--) {
> +                       subnode = ofnode_first_subnode(node);
> +                       if (!ofnode_valid(subnode))
> +                               break;
> +
> +                       for (j = 0; (j < i - 1); j++)
> +                               subnode = ofnode_next_subnode(subnode);
> +
> +                       if (!ofnode_valid(subnode))
> +                               break;
> +
> +                       const u32 *reg;
> +                       int len;
> +
> +                       suboff = fdt_find_or_add_subnode(blob, off, ofnode_get_name(subnode));
> +                       res = fdt_setprop_string(blob, suboff, "label",
> +                                                ofnode_read_string(subnode, "label"));
> +                       if (res)
> +                               return res;
> +
> +                       reg = ofnode_get_property(subnode, "reg", &len);
> +                       res = fdt_setprop(blob, suboff, "reg", reg, len);
> +                       if (res)
> +                               return res;
> +               }
> +
> +               /* go to next fixed-partitions node */
> +               node = ofnode_by_compatible(node, "fixed-partitions");
> +       }
> +
> +       return 0;
> +}
> +
>  void fdt_del_node_and_alias(void *blob, const char *alias)
>  {
>         int off = fdt_path_offset(blob, alias);
> diff --git a/include/fdt_support.h b/include/fdt_support.h
> index eeb83e6251d3..2cd836689821 100644
> --- a/include/fdt_support.h
> +++ b/include/fdt_support.h
> @@ -256,6 +256,14 @@ static inline void fdt_fixup_mtdparts(void *fdt,
>  }
>  #endif
>
> +/**
> + * copy the fixed-partition nodes from U-Boot device tree to external blob
> + *
> + * @param blob         FDT blob to update
> + * Return: 0 if ok, or non-zero on error
> + */
> +int fdt_copy_fixed_partitions(void *blob);
> +
>  void fdt_del_node_and_alias(void *blob, const char *alias);
>
>  /**
> --
> 2.25.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
