Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D294327FD
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 07:33:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6967AC98F73
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Jun 2019 05:33:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC08C98F72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 05:33:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x535X0nB091948;
 Mon, 3 Jun 2019 00:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1559539980;
 bh=e2610jdBWdMMrVd8FI2m6qYsp60SL/XFeqqGlywsl/c=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=t1IY0aM9oCT4OqRIb8FbOQuW2APcvKkl+ymlX2DVsMALMx5C7/VJmNGsAreE8xjeO
 Wf/IwZhMoXMDveHUKEW23BPXOuwV6W3eBS0u4ZpTZ2c/buX3BsZ/997OKRSf5F0DRB
 WXtiyRf3Tjvrtmqo2UtZi+At7ysuWAznXX9SAVlU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x535X0JG017382
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Jun 2019 00:33:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 3 Jun
 2019 00:33:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 3 Jun 2019 00:33:00 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x535WueS119040;
 Mon, 3 Jun 2019 00:32:57 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
 <1559308296-17027-4-git-send-email-fabien.dessenne@st.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <eed87d3a-393d-033e-b95a-54eec83dbe10@ti.com>
Date: Mon, 3 Jun 2019 11:02:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1559308296-17027-4-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/7] remoteproc: add device_to_virt ops
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



On 31/05/19 6:41 PM, Fabien Dessenne wrote:
> Introduce the device_to_virt function to allow translation between
> device address (remote processor view) and virtual address (main
> processor view).
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

> ---
>  include/remoteproc.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/remoteproc.h b/include/remoteproc.h
> index aa90a67..aef6ff2 100644
> --- a/include/remoteproc.h
> +++ b/include/remoteproc.h
> @@ -113,6 +113,18 @@ struct dm_rproc_ops {
>  	 * @return 0 on success, 1 if not responding, -ve on other errors.
>  	 */
>  	int (*ping)(struct udevice *dev);
> +
> +	/**
> +	 * device_to_virt() - Return translated virtual address (optional)
> +	 *
> +	 * Translate a device address (remote processor view) to virtual
> +	 * address (main processor view).
> +	 *
> +	 * @dev:	Remote proc device
> +	 * @da:		Device address
> +	 * @return virtual address.
> +	 */
> +	void * (*device_to_virt)(struct udevice *dev, ulong da);
>  };
>  
>  /* Accessor */
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
