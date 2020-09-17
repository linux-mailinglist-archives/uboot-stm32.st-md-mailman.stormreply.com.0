Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 732DA26D062
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 03:09:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 330A1C3FADF
	for <lists+uboot-stm32@lfdr.de>; Thu, 17 Sep 2020 01:09:33 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50886C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 01:09:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l15so3324894wmh.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 18:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MiNCv+z6EgbbB75IYJk3cuHFHE5LYZ1fK/xt4ubRdrU=;
 b=auVbKCT8t9X6DHgV/S9mRt4jiH1cTFwNs+XbLMxUwwdXX2sghmaglyv7VvXCqfx/OM
 l2GjG0m16nwQpFAV83J5m1VWWd5VHerk2HVTP2P60Yi4AR825oh2998f15ZQ2rCGhh//
 Ey0VlGK4tSzLwbm5qchgr/IAs1KG8W3G8Dge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MiNCv+z6EgbbB75IYJk3cuHFHE5LYZ1fK/xt4ubRdrU=;
 b=J6wuOPxFGdp+v2UClMM00tRXN28fPsohpIQj6sykRfZQgIuAn6yPCqUBM532GzUrX7
 RVmcqDvu8dALwwt4IGAJIUyJi19aGsMjIQnSj1ntx6pJ0KttWh1OQ/o46JggJPgv05ue
 SOX09fnz9OgfYE5GgxwYAGW1xAjG6VKhnWowxjL+zcQgKeW0OwWKlpJof+ijQCIWL7JD
 srTkLctdHcVUGHY1q9ENbo6iHKNaEo9UWnA9XR6bizB+QAvr6Ma1xcZpmtKgb3Uw4gAq
 VdeOqxck6XOPHmjUCuUXUHdeQuoxCJ+Th1+g6c14duYmgFgmUYECrmkpF0fX1PrVo+tn
 jgBw==
X-Gm-Message-State: AOAM530NZ/wa7CQF2r47D/qjbUqKnQxwj/WHy60OllfI3XYjBPdKQ5qc
 uq+JKvzFhYK2XJ/uJZOO4AusS4gLnb+1O7vJqMxvJA==
X-Google-Smtp-Source: ABdhPJyKDSf20SjvYH8Vng+14MsOYZ7WHshZOQ7eVyLHgB1mf2h6Jai6C0XwWKQZFKtF8b3PaJ30CxwuxyTHzLxa7fY=
X-Received: by 2002:a1c:b703:: with SMTP id h3mr7024206wmf.131.1600304971602; 
 Wed, 16 Sep 2020 18:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
In-Reply-To: <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 16 Sep 2020 19:09:19 -0600
Message-ID: <CAPnjgZ0tuXkNYzUUe7g1AAZ4VOWUyo425yrvx45nnyBsv8=3tg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Atish Patra <atish.patra@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bin.meng@windriver.com>, Rick Chen <rick@andestech.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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

On Thu, 10 Sep 2020 at 02:50, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Add boolean input argument @no_map to helper function
> fdtdec_add_reserved_memory() to add or not "no-map" property
> for an added reserved memory node.
>
> Property no-map is used by the Linux kernel to not not map memory
> in its static memory mapping. It is needed for example for the|
> consistency of system non-cached memory and to prevent speculative
> accesses to some firewalled memory.
>
> No functional change. A later change will update to OPTEE library to
> add no-map property to OP-TEE reserved memory nodes.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v4:
>    - Reword commit message
>
> Changes in v2:
>    - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
>    fdtdec_add_reserved_memory() new parameter
>
>  arch/riscv/lib/fdt_fixup.c |  2 +-
>  include/fdtdec.h           |  5 +++--
>  lib/fdtdec.c               | 10 ++++++++--
>  lib/optee/optee.c          |  2 +-
>  test/dm/fdtdec.c           |  6 +++---
>  5 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
