Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C95912A9
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Aug 2022 17:11:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EABCC04005;
	Fri, 12 Aug 2022 15:11:20 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B005FC04004
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 15:11:18 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id j5so1447110oih.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=zdlBsg7sQAhivhK/n5uu2N9NxDVvH8KdNpV5wk9Zsss=;
 b=gwGDsRPiNBxnK3azbBxC49qz74Caci3gReJK6ZoheGnG0CmJdLTKClGBDC2PR62Hjx
 eJAQQflGPO1zpn663lUL4qqcxGravio84DvQZ1MCrM5JVi0fKJT/KDI6WXhGixEeANHY
 AGh678pJpcANyYkFCcf1MQFnbAj8evzOmZVJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=zdlBsg7sQAhivhK/n5uu2N9NxDVvH8KdNpV5wk9Zsss=;
 b=DjrKcGrEoHjhOWn2xQxE5RjzUchWs7Jsr8ARVbdVIJEvvhee74286G+1AEvXv/+mHf
 46Q3DC+LSI1RUPsdgkt4sFT4C8R9x5q4oER7Gb8Vr6HwUOIKA3sGBuwRfG41OBjkiyWG
 cALkFCO9kAjQO537itjqDmwWo7OeHzoYIr84WKQ3E4LEfX/m8b1oa1b+5XAdvO5+iVnO
 1Ime/TvzSX5WEsFHwBIt2nJf3ImxDFLlnsuAyN7Ij96fE75KyRxqOp7yJYFOSVi1MdmK
 bEinzn8NozqVejVVl511vQeQggOR/VMEI3irHINf3ZW4hRed/arh1hdhknQxNIZosg9X
 91KQ==
X-Gm-Message-State: ACgBeo0F3nlmd/kCNdqpIWBB/khu367+OTxwcTRn+fyym4my1LsWsoP5
 Tv+YhfrfREVVZidyJ0VAcR5LAr8eZOBLkLc9dW/Y+g==
X-Google-Smtp-Source: AA6agR4a+xquRRmMaL9GYeNGrIdGs/1vCvnYMc4tXln1YcWAa0aAQrTvdTBR/+t4tOij/V5qUMQUoNBUK85m3khBCXc=
X-Received: by 2002:a05:6808:bcb:b0:33a:c532:54fc with SMTP id
 o11-20020a0568080bcb00b0033ac53254fcmr5635102oik.170.1660317077013; Fri, 12
 Aug 2022 08:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220812013503.1724919-1-sjg@chromium.org>
 <fc7f6587-4ac8-2b65-a71c-3ba6930912b3@gmail.com>
In-Reply-To: <fc7f6587-4ac8-2b65-a71c-3ba6930912b3@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 12 Aug 2022 09:11:06 -0600
Message-ID: <CAPnjgZ0Tof+K_nxpQuJQN5t+ypYiQ-+f642u-qz=oq3zMovJMg@mail.gmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Bidnichenko <oleksii.bidnichenko@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Rick Chen <rick@andestech.com>,
 Lukasz Majewski <lukma@denx.de>, Gary Bisson <gary.bisson@boundarydevices.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>, Stefan Roese <sr@denx.de>,
 Wolfgang Denk <wd@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <kettenis@openbsd.org>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alexey Brodkin <abrodkin@synopsys.com>, Huang Jianan <jnhuang95@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ricardo Salveti <ricardo@foundries.io>, Ramon Fried <rfried.dev@gmail.com>,
 Tony Dinh <mibodhi@gmail.com>, Heiko Schocher <hs@denx.de>,
 Marek Vasut <marex@denx.de>, Philippe Schenker <philippe.schenker@toradex.com>,
 Ye Li <ye.li@nxp.com>, Judy Wang <wangjudy@microsoft.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, schspa <schspa@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Denys Drozdov <denys.drozdov@toradex.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Andrew Davis <afd@ti.com>,
 Anastasiia Lukianenko <vicooodin@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Max Merchel <Max.Merchel@tq-group.com>, TsiChung Liew <Tsi-Chung.Liew@nxp.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Andrew Scull <ascull@google.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/24] blk: Rationalise the block
	interface
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

Hi Johan,

On Fri, 12 Aug 2022 at 07:51, Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi Simon and others,
>
> Some comments. Have a look if it's useful.
> Include is an example of how currently a new Rockchip external RKNAND FTL block device must be included in U-boot.
> Changes must be made all over the place. EFI has now become a somewhat "obligation" for block devices, then handling
> should be made more easy I propose.
>
> 1:
> The creation and removal of block devices is kind of dynamic with the blk_create_device function.
> Is it possible to make the necessary functions in efi_device_path.c and part.c more flexible as well by
> a new "blk_create_efi_device()" and "blk_remove_efi_device()" function? So everything combined in one function.

Do you mean to automatically create a device with the right uclass?
Yes I think that could be done, but I have not looked at it.

>
> 2:
> Make the class list more dynamic/expendable. Each time a new clas is needed the source code must be changed.
> Include a function that returns a generated class number that takes in account the existing know classes.
> ie,: "uclass_create" and "uclass_remove".
>
> Example block device creation:
>
>         ret = uclass_get_device(UCLASS_RK_IDB, 0, &dev);
>
> // Be able to use a dynamic generated UCLASS for block devices.
>
>         if (ret) {
>                 printf("no IDB device found\n");
>                 return CMD_RET_FAILURE;
>         }
>         ret = blk_get_device(IF_TYPE_RK_IDB, 0, &bdev);
>         if (ret) {
>                 ret = blk_create_device(dev, "idb_blk", "blk",
>                                         IF_TYPE_RK_IDB, 0, 512,
>                                         LBA, &bdev);
>                 if (ret)
>                         return ret;
>
>                 ret = blk_probe_or_unbind(bdev);
>                 if (ret)
>                         return ret;
>         }
>
> Example block device removal:
>
>         ret = blk_find_device(IF_TYPE_RK_IDB, 0, &bdev);

Note that the IF_TYPE goes away with this series and there is just the uclass.

>
> // Be able to find back a dynamic generated UCLASS.
>
>         if (ret) {
>                 printf("no IDB blk device found\n");
>                 return 0;
>         }
>
>         device_remove(bdev, DM_REMOVE_NORMAL);
>         device_unbind(bdev);
>
> Make efi functions more flexible by replacing switch() functions by call back functions for:
>
> dp_fill
> dp_size
> dev_print
> print_part_header
>
> Add them with "blk_create_efi_device()" in a structure.
> If not defined fall back to standard functions.

We are trying to integrate EFI better into U-Boot so that it uses the
normal devices. At present it has some parallel infrastructure.

Please take a look at your patch after applying this series, then let
me know what you think is needed.

Regards,
Simon



>
> ====
>
> Kind regards,
>
> Johan Jonker
>
> On 8/12/22 03:34, Simon Glass wrote:
> > The block interface has two separate implementations, one using driver
> > model and one not. The latter is really only needed for SPL, where
> > size constraints allegedly don't allow use of driver model. Of course
> > we still need space for filesystems and other code, so it isn't clear
> > that driver model is anything more than the straw that breaks the
> > camel's back.
> >
> > The driver model version uses a uclass ID for the interface time, but
> > converts back and forth between that and if_type, which is the legacy
> > type.
> >
> > The HAVE_BLOCK_DEVICE define is mostly a hangover from the old days.
> > At present its main purpose is to enable the legacy block implementation
> > in SPL.
> >
> > Finally the use of 'select' to enable BLK does not work very well. It
> > causes kconfig errors when another option depends on BLK and it is
> > not recommended by the kconfig style guide.
> >
> > This series aims to clean things up:
> > - Enable BLK based on whether different media types are used, but still
> >   allow boards to disable it
> > - Rename HAVE_BLOCK_DEVICE to indicates its real purpose
> > - Drop if_type and use the uclass instead
> > - Drop some obsolete if_type values
> >
> > An issue not resolved by this series is that the sandbox host interface
> > does not actually have a device. At present it uses the root device, which
> > was convenience for the driver model conversion but not really correct. It
> > should be possible to clean this up, in a future series.
> >
> > Another minor issue is the use of UCLASS_USB for a mass-storage device.
> > This has been the case for a while and is not addresed by this series,
> > other than to add a comment.
> >
> > Note that this test relies on Tom Rini's series to drop various boards
> > including warp and cm_t335
> >
> > Finally, a patch is included to make binman put fake files in a
> > subdirectory, since repeated runs of certain boards can cause unrelated
> > failues (e.g. chromebook_coral) when fake files are left around.
> >
> > Changes in v2:
> > - Update commit message
> > - Fix SPL_PARTITIONS too
> > - Add SATA also
> > - Refer to a suffix, not a prefix
> > - Add new patch to handle UCLASS_EFI_MEDIA in dev_print()
> > - Add new patch to drop ifname field from struct efi_disk_obj
> > - Use conv_uclass_id() instead of the confusing uclass_id_to_uclass_id()
> >
>
> From d0bb794b966a0134a6f321a414b48c28e8894180 Mon Sep 17 00:00:00 2001
> From: Johan Jonker <jbx6244@gmail.com>
> Date: Sun, 7 Aug 2022 15:25:55 +0200
> Subject: prepare rknand
>
>
> diff --git a/disk/part.c b/disk/part.c
> index 79955c7fb0..3f8b97a6c6 100644
> --- a/disk/part.c
> +++ b/disk/part.c
> @@ -150,6 +150,7 @@ void dev_print (struct blk_desc *dev_desc)
>         case IF_TYPE_USB:
>         case IF_TYPE_NVME:
>         case IF_TYPE_PVBLOCK:
> +       case IF_TYPE_RKNAND:
>         case IF_TYPE_HOST:
>                 printf ("Vendor: %s Rev: %s Prod: %s\n",
>                         dev_desc->vendor,
> @@ -293,6 +294,9 @@ static void print_part_header(const char *type, struct blk_desc *dev_desc)
>         case IF_TYPE_PVBLOCK:
>                 puts("PV BLOCK");
>                 break;
> +       case IF_TYPE_RKNAND:
> +               puts("RKNAND");
> +               break;
>         case IF_TYPE_VIRTIO:
>                 puts("VirtIO");
>                 break;
> diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
> index 0b5f219d90..28b21836c4 100644
> --- a/drivers/block/blk-uclass.c
> +++ b/drivers/block/blk-uclass.c
> @@ -33,6 +33,7 @@ static const char *if_typename_str[IF_TYPE_COUNT] = {
>         [IF_TYPE_VIRTIO]        = "virtio",
>         [IF_TYPE_PVBLOCK]       = "pvblock",
>         [IF_TYPE_RK_IDB]        = "idb",
> +       [IF_TYPE_RKNAND]        = "rknand",
>  };
>
>  static enum uclass_id if_type_uclass_id[IF_TYPE_COUNT] = {
> @@ -51,6 +52,7 @@ static enum uclass_id if_type_uclass_id[IF_TYPE_COUNT] = {
>         [IF_TYPE_VIRTIO]        = UCLASS_VIRTIO,
>         [IF_TYPE_PVBLOCK]       = UCLASS_PVBLOCK,
>         [IF_TYPE_RK_IDB]        = UCLASS_RK_IDB,
> +       [IF_TYPE_RKNAND]        = UCLASS_RKNAND,
>  };
>
>  static enum if_type if_typename_to_iftype(const char *if_typename)
> diff --git a/include/blk.h b/include/blk.h
> index a73cc577a0..56f2415e21 100644
> --- a/include/blk.h
> +++ b/include/blk.h
> @@ -30,6 +30,7 @@ enum if_type {
>         IF_TYPE_USB,
>         IF_TYPE_DOC,
>         IF_TYPE_MMC,
> +       IF_TYPE_RKNAND,
>         IF_TYPE_SD,
>         IF_TYPE_SATA,
>         IF_TYPE_HOST,
> diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
> index 38a227f006..b102cdf46e 100644
> --- a/include/dm/uclass-id.h
> +++ b/include/dm/uclass-id.h
> @@ -104,6 +104,7 @@ enum uclass_id {
>         UCLASS_REGULATOR,       /* Regulator device */
>         UCLASS_REMOTEPROC,      /* Remote Processor device */
>         UCLASS_RESET,           /* Reset controller device */
> +       UCLASS_RKNAND,          /* Rockchip nand device with ftl */
>         UCLASS_RK_IDB,          /* Rockchip IDB device */
>         UCLASS_RNG,             /* Random Number Generator */
>         UCLASS_RTC,             /* Real time clock device */
> diff --git a/include/efi_loader.h b/include/efi_loader.h
> index 44d426035a..ddc7082ad6 100644
> --- a/include/efi_loader.h
> +++ b/include/efi_loader.h
> @@ -145,6 +145,10 @@ static inline efi_status_t efi_launch_capsules(void)
>  #define U_BOOT_IDB_DEV_GUID \
>         EFI_GUID(0xadc021df, 0x5f24, 0x464f, \
>                  0x9a, 0x88, 0xdb, 0xee, 0x3f, 0x1d, 0x14, 0x0f)
> +/* GUID used as root for Rockchip RKNAND devices */
> +#define U_BOOT_RKNAND_DEV_GUID \
> +       EFI_GUID(0xe39f6cbb, 0x055a, 0x45a0, \
> +                0xb2, 0x75, 0x56, 0x0d, 0xa5, 0x22, 0x25, 0x99)
>
>  /* Use internal device tree when starting UEFI application */
>  #define EFI_FDT_USE_INTERNAL NULL
> diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_device_path.c
> index b7535373e7..9691f02b2e 100644
> --- a/lib/efi_loader/efi_device_path.c
> +++ b/lib/efi_loader/efi_device_path.c
> @@ -31,6 +31,9 @@ const efi_guid_t efi_guid_virtio_dev = U_BOOT_VIRTIO_DEV_GUID;
>  #if CONFIG_IS_ENABLED(ROCKCHIP_IDB)
>  const efi_guid_t efi_guid_idb_dev = U_BOOT_IDB_DEV_GUID;
>  #endif
> +#if CONFIG_IS_ENABLED(RKNAND)
> +const efi_guid_t efi_guid_rknand_dev = U_BOOT_IDB_DEV_GUID;
> +#endif
>
>  /* template END node: */
>  static const struct efi_device_path END = {
> @@ -578,6 +581,16 @@ __maybe_unused static unsigned int dp_size(struct udevice *dev)
>                         return dp_size(dev->parent)
>                                 + sizeof(struct efi_device_path_vendor) + 1;
>  #endif
> +#if CONFIG_IS_ENABLED(RKNAND)
> +               case UCLASS_RKNAND:
> +                        /*
> +                         * Rockchip IDB device will be represented
> +                         * as vendor device with extra one byte for
> +                         * device number
> +                         */
> +                       return dp_size(dev->parent)
> +                               + sizeof(struct efi_device_path_vendor) + 1;
> +#endif
>  #if CONFIG_IS_ENABLED(ROCKCHIP_IDB)
>                 case UCLASS_RK_IDB:
>                          /*
> @@ -680,6 +693,23 @@ __maybe_unused static void *dp_fill(void *buf, struct udevice *dev)
>                         return &dp->vendor_data[1];
>                         }
>  #endif
> +#if CONFIG_IS_ENABLED(RKNAND)
> +               case UCLASS_RKNAND: {
> +                       struct efi_device_path_vendor *dp;
> +                       struct blk_desc *desc = dev_get_uclass_plat(dev);
> +
> +                       dp_fill(buf, dev->parent);
> +                       dp = buf;
> +                       ++dp;
> +                       dp->dp.type = DEVICE_PATH_TYPE_HARDWARE_DEVICE;
> +                       dp->dp.sub_type = DEVICE_PATH_SUB_TYPE_VENDOR;
> +                       dp->dp.length = sizeof(*dp) + 1;
> +                       memcpy(&dp->guid, &efi_guid_rknand_dev,
> +                              sizeof(efi_guid_t));
> +                       dp->vendor_data[0] = desc->devnum;
> +                       return &dp->vendor_data[1];
> +                       }
> +#endif
>  #if CONFIG_IS_ENABLED(ROCKCHIP_IDB)
>                 case UCLASS_RK_IDB: {
>                         struct efi_device_path_vendor *dp;
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
