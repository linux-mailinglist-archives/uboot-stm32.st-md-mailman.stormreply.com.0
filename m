Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8643A0692
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Jun 2021 00:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFA4DC57B78;
	Tue,  8 Jun 2021 22:10:23 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32A8AC57B75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623190219;
 bh=ZUqtvz8/IsMyNyqYSM/UGgZqJNqoAiugQv3ohZTy02E=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Jn2dvsCZyzWvTI+YjR/CuInBbTiXfq9EqKAGv2x8SkeiOtjq5LTUrtAINvlbtAAzM
 Eo3zVRl3XigoGeS7J2KWsMSa/OFXh/phEVFxxXv2wM1P92+1wybvjjwjGvyJv9ccMH
 HVq5hvPngvMjkuxUhCxgeKTrkB2jqStpa1KxUdRA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1lwOwq2Sjb-00TQp7; Wed, 09
 Jun 2021 00:10:19 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210604165147.31788-1-patrick.delaunay@foss.st.com>
 <20210604185138.v2.2.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <e4a44568-bd41-a9d9-67b7-e7238760f981@gmx.de>
Date: Wed, 9 Jun 2021 00:10:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604185138.v2.2.I567147108d7efaa02a3532cde06cf1d5df59ce38@changeid>
Content-Language: en-US
X-Provags-ID: V03:K1:ik7blwTPoE5KOck9R9gGhhlWEF5+T6wfivTQ1DXjK3DEiE5enaw
 lHML7ulCQb9qDRHMmF8jdGkKX0FYtsplOV++LrAL7Ryh/fxqcGvcVvzOjyvpJmRBDjPDBu+
 wtRO4/wP2FVDR+yMEpTMOhWX9ZZDwNsmFsnNIEQXxz+Cagb9reKzp3Cg+UBYaXTixbtOf2W
 lOBvjeMyCx11g/bdyHqjg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cp9iMQaaECE=:PovVsbI/H4h0x7lZ5rtAD2
 xMaTR+QKdXjDcdcDLhC+rj37GvMWSXlYKOSQmlN9kcgKqMIoIYPq9csjcsGJf+Csw3f0/7wzI
 /2JCw+H4PomuuUTk/bZXyyu+BsPZoPq1Bx+r6e6ERBvLHMRKKES6DjBM5tKdjTso90W5uftcM
 2S1c1aAZ4iCIElmLjWLJvGBYZsTVCTyQpCCFI7Y+06QL3qdMywbHVJHBwwHfXZ2HsOuljMvMw
 okyadRvYHLgS9jtaA6cc6/uxt5Oa1Ve4i+x2fp2SXYSjG4MM1PGljAWm1HYDvCdcMea+HZZF0
 uX2ihEaq8yFUi3dc84cd3SNSeMyOlqZ5bYtSxrDwA4hs2EhcEsiiORdfPDcW1CSVCSFqc5IuR
 LbA0FQ9u6eEbfaRNBjb9MgHxmC3Kj49ihJpz96AVL5cobcdAWgO0OMq48ArsiPM+PRhq3jRnv
 cxpzSNpiQLiu5WorvdH2yXtt8yF+eeX/DfjDdqdyjnGgjhBb96OD1nJWATVviH5e0QxljoK9K
 VW6nlIBRXj5eIrNuXsNjDmEmKZlq/O/0gt98+HILoqK2ZED0Hjh4bx3US23p9od44+oaCrQ9w
 ixFHiZEL38+lK0YQ3D9IEvgjP223XbvZC2/BQ44kKxow3ixXSPcgczi0+uf5pT8R/Y/ea1AMd
 vPg09jsoNUAwvQtipq3SfJ/hybgdM2ESWpHKcHqivBLWLadKTmnqKjF1gRkru/3rXEblTkxg8
 3TMH66SHciQZhlm7TCUi7irnG31swNG9+MOLkyrWPio29Y6t1xOxyyVairCk46/nDb+0WsRAT
 PL+Zfm9/e7wNEGGbvV39twrzGoeFxP2xNI/VG5YyqWKgrLB53JC8KQKMxFqTUkBaltkSitejt
 ANURZ5LGlhzzAMb7bxwt0ATwRM51EhxooQLS2/Y1xROy9/HQU0K6qPDbjQmD1MJVH2Sjcjx+S
 YmoLJ7CTp0hYePR8khdJEr9nR+/fkT/qZ2tF8GoI+i6/Lt0wOvovYOdQigI6q/0JbvTGNZ6l6
 fmAFKEHxF/pILHqAgm9Rx9HV9+q7gsXtv4AFTHpQ7kj8dDIE/VXgSGcbajj5FmwfA0ostoRkW
 0uLXrFT7JBGOefTusQAx8UBpjvdLYugFFgO
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] doc: usage: man-page for ums
	command
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 6/4/21 6:51 PM, Patrick Delaunay wrote:
> Provide a man-page for the ums command - USB Mass Storage.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - clarify description
> - add reference to <partitions> and align parameter name
> - correct information for partition = 0 (expose all partitions)
> - update dependency
>
>   doc/usage/index.rst |  1 +
>   doc/usage/ums.rst   | 57 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
>   create mode 100644 doc/usage/ums.rst
>
> diff --git a/doc/usage/index.rst b/doc/usage/index.rst
> index 41b247bc62..1bab6ae3e9 100644
> --- a/doc/usage/index.rst
> +++ b/doc/usage/index.rst
> @@ -43,3 +43,4 @@ Shell commands
>      scp03
>      size
>      true
> +   ums
> diff --git a/doc/usage/ums.rst b/doc/usage/ums.rst
> new file mode 100644
> index 0000000000..19d2ebb4a6
> --- /dev/null
> +++ b/doc/usage/ums.rst
> @@ -0,0 +1,57 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +ums command
> +===========
> +
> +Synopsis
> +--------
> +
> +::
> +
> +    <dev> [<interface>] <devnum[:partnum]>

ums missing. I can add it when merging.

Otherwise

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>


> +
> +Description
> +-----------
> +
> +Use the USB Mass Storage class (also known as UMS) to make accessible an U-Boot
> +block device (fully or with :ref:`U-Boot's partition syntax <partitions>`)
> +to a USB host and to enable file transfers. U-Boot, the USB device, acts as a
> +simple external hard drive plugged on the host USB port.
> +
> +This command "ums" stays in the USB's treatment loop until user enters Ctrl-C.
> +
> +dev
> +    USB gadget device number
> +
> +interface
> +    interface for accessing the block device (mmc, sata, scsi, usb, ....)
> +    defaults is "mmc"
> +
> +devnum
> +    device number for selected interface
> +
> +partnum
> +    partition number or 0 to expose all partitions, defaults to 0
> +
> +Example
> +-------
> +
> +::
> +
> +    => ums 0 mmc 0
> +    => ums 0 usb 1:2
> +
> +Configuration
> +-------------
> +
> +The ums command is only available if CONFIG_CMD_USB_MASS_STORAGE=y
> +and depends on CONFIG_USB_USB_GADGET and CONFIG_BLK.
> +
> +Return value
> +------------
> +
> +The return value $? is set to 0 (true) when the USB stack was successfully
> +started and interrupted, with Ctrl-C or after USB cable issue (detection
> +timeout or cable removal).
> +
> +If an error occurs, the return value $? is set to 1 (false).
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
